<?php
//connect
$con = mysqli_connect("localhost","username","password","database_name");

// error
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

// get data
if(isset($_POST['submit'])) {
  $name = $_POST['name'];
  $price = $_POST['price'];
  $description = $_POST['description'];

  $sql = "INSERT INTO products (name, price, description) VALUES ('$name', '$price', '$description')";

  mysqli_query($con, $sql);
}

// select items from sql
$sql = "SELECT * FROM products";
$result = mysqli_query($con, $sql);
?>

<!DOCTYPE html>
<html>
<head>
  <title>محصولات</title>
</head>
<body>
  <!-- add items-->
  <h2>ایجاد محصولات</h2>
  <form method="POST" action="">
    <label>نام محصول:</label>
    <input type="text" name="name"><br><br>

    <label>قیمت:</label>
    <input type="text" name="price"><br><br>

    <label>توضیحات:</label>
    <textarea name="description"></textarea><br><br>

    <button type="submit" name="submit">ذخیره</button>
  </form>

  <hr>

  <!-- list items-->
  <h2>لیست محصولات</h2>
  <table>
    <tr>
      <th>نام محصول</th>
      <th>قیمت</th>
      <th>توضیحات</th>
    </tr>

    <?php while($row = mysqli_fetch_array($result)):?>
      <tr>
        <td><?=$row['name']?></td>
        <td><?=$row['price']?> تومان</td>
        <td><?=$row['description']?></td>
      </tr>
    <?php endwhile;?>
  </table>

</body>
</html>
