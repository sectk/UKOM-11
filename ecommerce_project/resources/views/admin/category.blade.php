<!DOCTYPE html>
<html>
  <head> 
   @include ('admin.css')

   <style type="text/css" >

    input[type='text']
    {
        width: 400px;
        height: 50px;
    }

    .div_deg
    {
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 30px;
    }

    .table_deg
    {
      text-align: center;
      margin: auto;
      border: 2px solid yellowgreen;
      margin-top: 50px;
      width: 600px;
    }

    th
    {
      background-color: skyblue;
      padding: 15px;
      font-size: 20px;
      font-weight: bold;
      color:  white;
    }

    td
    {
      color: white;
      padding: 10px;
      border: 1px solid skyblue;
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

        <h1 style="color: white;" >Add Category</h1>

        @if(session('succes'))
         <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('succes') }}
        </div>
          @endif

        <div class="div_deg">

            <form action="{{url('add_category')}}" method="post">
              @csrf
                <div>
                    <input type="text" name="category">
               
                    <input class="btn btn-primary" type="submit" value="Add Category" >
                </div>
            </form>
        </div>

        <div>


        <table class="table_deg">

              <tr>
                <th>Category Name</th>

                <th>Edit</th>

                <th>Delete</th>
              </tr>

              @foreach($data as $data)
              <tr>
                <td>{{$data->category_name}}</td>

                <td>
                  <a class="btn btn-success" 
                  href="{{url('edit_category',$data->id)}}">Edit</a>
                </td>



                <td>
                  <a class="btn btn-danger" onclick="confirmation(event)" 
                  href="{{url('delete_category',$data->id)}}">Delete</a>
                </td>
              </tr>
              @endforeach
        </table>


        </div>

        </div>
      </div>
    </div>
  </body>

  <!-- JavaScript files-->
    <script type="text/javascript">

    function confirmation(ev) {
    ev.preventDefault();

    var urlToRedirect = ev.currentTarget.getAttribute('href');

    console.log(urlToRedirect);

    swal({
        title: "Are You Sure to Delete This ?",
        text: "This delete will be permanent",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((willCancel) => {
        if (willCancel) {
            window.location.href = urlToRedirect;
        }
    });
}
    </script>

</html>