<!DOCTYPE html>
<html>

<head>
    @include ('admin.css')

    <style type="text/css">
        table {
            border: 2px solid skyblue;
            text-align: center;
        }

        th {
            background-color: skyblue;
            padding: 10px;
            font-size: 18px;
            font-weight: bold;
            text-align: center;
        }

        td {
            color: white;
            padding: 10px;
            border: solid yellowgreen;
        }

        .table_center {
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
        }
    </style>

</head>

<body>

    @include ('admin.header')

    @include ('admin.sidebar')
    <!-- Sidebar Navigation end-->
    <div class="page-content">
        <div class="page-header">
            <div class="container-fluid">

            <h3>All Orders</h3>

            <br>
            <br>

                <div class="table_center">

                    <table>
                        <tr>
                            <th>Customer name</th>
                            <th>Order Date</th>
                            <th>Addres</th>
                            <th>Phone</th>
                            <th>Product title</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Change Status</th>
                            <th>Print</th>
                        </tr>

                        @foreach ($data as $order)

                        <tr>
                            <td>{{$order->name}}</td>
                            <td>{{$order->created_at->format('Y-m-d')}}</td>
                            <td>{{$order->rec_address}}</td>
                            <td>{{$order->phone}}</td>
                            <td>{{$order->product->title}}</td>
                            <td>{{ number_format(floatval(str_replace('.', '', $order->product->price)) * $order->quantity, 0, ',', '.') }}</td>
                            <td>
                                <img width="130" src="products/{{$order->product->image}}">
                            </td>
                            <td>{{$order->quantity}}</td>
                            <td>
                                @if($order->status == 'in progress')

                                <span style="color:red">{{$order->status}}</span>

                                @elseif($order->status == 'On the way')

                                <span style="color: skyblue;">{{$order->status}}</span>

                                @else

                                <span style="color: yellow;">{{$order->status}}</span>

                                @endif


                            </td>
                            <td>
                                <a class="btn btn-primary" href="{{url('on_the_way',$order->id)}}">On the way</a>
                                <a class="btn btn-success" href="{{url('delivered',$order->id)}}">Delivered</a>
                            </td>

                            <td>
                                <a class="btn btn-secondary" href="{{url('print_pdf',$order->id)}}">Print PDF</a>
                            </td>



                        </tr>

                        @endforeach

                    </table>

                </div>


            </div>
        </div>
    </div>
    @include ('admin.js')
</body>

</html>