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

        .cart_value
        {
            text-align: center;
            margin-bottom: 70px;
            font-size: 20px;
            font-weight: bold;
            padding: 18px;
        }

    </style>
</head>

<body>
  <div class="hero_area">
    <!-- header section starts -->
     @include('home.header')
  </div>

  <div class="div_deg">
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
  <p class="cart_value" >Total Price: Rp{{ number_format($total, 0, ',', '.') }}</p>

  <!-- info section -->
  @include('home.footer')
</body>

</html>
