<!DOCTYPE html>
<html lang="en">
<head>
    @include('home.css')
    <style>
        .container {
            margin: 60px auto;
            max-width: 1200px;
            padding: 0 20px;
        }

        .form-container {
            margin-bottom: 30px;
        }

        .form-container label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .form-container input, 
        .form-container textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 15px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 10px;
        }

        th {
            background-color: #343a40;
            color: white;
            font-weight: bold;
        }

        td img {
            max-width: 150px;
            height: auto;
        }

        .alert {
            max-width: 400px;
            margin: 20px auto;
        }

        .cart-summary {
            text-align: center;
            margin-top: 30px;
            font-size: 20px;
            font-weight: bold;
        }

        .remove-btn {
            color: #dc3545;
            font-weight: bold;
            text-decoration: none;
            background-color: #f8d7da;
            padding: 5px 10px;
            border-radius: 4px;
        }

        .remove-btn:hover {
            background-color: #f5c6cb;
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="hero_area">
        @include('home.header')
    </div>

    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif

    <div class="container">
        <div class="form-container">
            <form action="{{ url('comfirm_order') }}" method="POST">
                @csrf
                <div class="form-group">
                    <label for="name">Receiver Name</label>
                    <input type="text" id="name" name="name" value="{{ Auth::user()->name }}" required>
                </div>

                <div class="form-group">
                    <label for="address">Receiver Address</label>
                    <textarea id="address" name="address" rows="4" required>{{ Auth::user()->address }}</textarea>
                </div>

                <div class="form-group">
                    <label for="phone">Receiver Phone</label>
                    <input type="text" id="phone" name="phone" value="{{ Auth::user()->phone }}" required>
                </div>

                <div class="form-group">
                    <input type="submit" value="Cash On Delivery">
                </div>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Product Title</th>
                    <th>Order Date</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                @php
                $total = 0;
                @endphp

                @foreach ($cart as $item)
                <tr>
                    <td>{{ $item->product->title }}</td>
                    <td>{{ $item->created_at->format('Y-m-d') }}</td>
                    <td>{{ number_format(floatval(str_replace('.', '', $item->product->price)) * $item->quantity, 0, ',', '.') }}</td>
                    <td>
                        <img src="/products/{{ $item->product->image }}" alt="{{ $item->product->title }}">
                    </td>
                    <td>
                        <a href="{{ url('decrease_cart', $item->product_id) }}">-</a>
                        {{ $item->quantity }}
                        <a href="{{ url('add_cart', $item->product_id) }}">+</a>
                    </td>
                    <td>
                        <a class="remove-btn" href="{{ url('delete_cart', $item->id) }}">Remove</a>
                    </td>
                    @php
                    $price = str_replace('.', '', $item->product->price);
                    $total += floatval($price) * $item->quantity;
                    @endphp
                </tr>
                @endforeach
            </tbody>
        </table>

        <div class="cart-summary">
            Total Price: Rp{{ number_format($total, 0, ',', '.') }}
        </div>
    </div>

    @include('home.footer')
</body>
</html>
