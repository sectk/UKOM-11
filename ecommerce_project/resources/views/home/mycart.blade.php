<!DOCTYPE html>
<html>

<head>
    @include('home.css')
    <style type="text/css">
        .div_deg {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 60px;
        }

        table {
            border: 2px solid black;
            text-align: center;
            width: 800px;
        }

        th {
            border: 2px solid black;
            text-align: center;
            color: white;
            font-size: 20px;
            font-weight: bold;
            background-color: black;
        }

        td {
            border: 1px solid skyblue;
        }

        .cart_value {
            text-align: center;
            margin-bottom: 70px;
            font-size: 20px;
            font-weight: bold;
            padding: 18px;
        }

        .order_deg {
            padding-right: 100px;
            margin-top: -50px;
        }

        label {
            display: inline-block;
            width: 150px;
        }

        .div_gap {
            padding: 5px;
        }

        .custom-alert {
            max-width: 400px;
            /* Atur lebar maksimum sesuai kebutuhan */
            margin: 0 auto;
            /* Memusatkan alert secara horizontal */
        }
    </style>
</head>

<body>
    <div class="hero_area">
        <!-- header section starts -->
        @include('home.header')
    </div>

    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show custom-alert" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    @endif


    <div class="div_deg">

        <div class="order_deg">
            <form action="{{url('comfirm_order')}}" method="Post">
                @csrf
                <div class="div_gap">
                    <label>Receiver Name</label>

                    <input type="text" name="name" value="{{Auth::user()->name}}">
                </div>

                <div class="div_gap">
                    <label>Receiver Addres</label>

                    <textarea name="address">{{Auth::user()->address}}</textarea>
                </div>

                <div class="div_gap">
                    <label>Receiver Phone</label>

                    <input type="text" name="phone" value="{{Auth::user()->phone}}">
                </div>

                <div class="div_gap">

                    <input class="btn btn-primary" type="submit" value="Cash On Delivery">
                </div>

            </form>
        </div>

        <table>
            <tr>
                <th>Product Title</th>
                <th>Price</th>
                <th>Image</th>
                <th>Remove</th>
            </tr>

            @php
            $total = 0;
            @endphp

            @foreach ($cart as $item)
            <tr>
                <td>{{ $item->product->title }}</td>
                <td>{{ number_format(floatval(str_replace('.', '', $item->product->price)), 0, ',', '.') }}</td>
                <td>
                    <img width="150" src="/products/{{ $item->product->image }}" alt="Product Image">
                </td>

                <td>
                    <a class="btn btn-danger" href="{{ url('delete_cart', $item->id) }}">Remove</a>
                </td>

                @php
                // Menghapus titik dari harga dan mengkonversi ke float
                $price = str_replace('.', '', $item->product->price);
                $total += floatval($price);
                @endphp
            </tr>
            @endforeach
        </table>
    </div>
    <p class="cart_value">Total Price: Rp{{ number_format($total, 0, ',', '.') }}</p>

    <!-- info section -->
    @include('home.footer')
</body>

</html>