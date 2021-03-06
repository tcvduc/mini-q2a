<?php

use App\Models\QuestionCategoryModel;
?>



<div class="container">

    <div class="card mt-3">
        <div class="card-header">
            <h4>Quản lý loại câu hỏi</h4>

        </div>
        <div class="card-body">


            <table id="table_quecate" class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Tên loại câu hỏi</th>

                    </tr>
                </thead>

                <tbody>

                    <?php

                    foreach ($data[0]  as $questionCate) {
                        echo ' <tr>';
                        echo ' <th scope="row">' . $questionCate['que_cate_id'] . ' </th>';
                        echo ' <td><span>' . $questionCate['que_cate_name'] . ' </span>';
                        echo '<span class="float-right">';
                        echo '<form method="POST"  >';
                        echo ' <button class="btn btn-danger "  name="btnDel" value="'
                            . $questionCate['que_cate_id']
                            . ' ">Xóa</button>';

                        echo ' <but class="btn btn-warning ml-2 "  name="btnEdit"
                        type="button" 
                        data-toggle="modal"
                         data-target="#modalEdit" 
    
                        data-whatever=' . $questionCate['que_cate_id'] . '
                        value="' . $questionCate['que_cate_id'] . ' ">Chỉnh sửa </but>';
                        echo  '</form>';
                        echo '</span>';
                        echo '</td>';
                        echo '  </tr>';
                    }
                    ?>



                </tbody>
            </table>
        </div>
        <div class="card-footer text-muted">
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#fmAddQuestionCate">
                Thêm loại câu hỏi
            </button>

        </div>
    </div>


</div>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<!-- ---------------------------- -->
<!-- handle add quetion category -->
<!-- ---------------------------- -->

<!-- Modal  add -->
<form method="POST" class="modal fade" id="fmAddQuestionCate" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Thêm loại câu hỏi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="txtQuestionCateName">Tên loại</label>
                    <input type="text" class="form-control" name="txtQuestionCateName" id="txtQuestionCateName" aria-describedby="helpId" placeholder="">
                    <!-- <small id="helpId" class="form-text text-muted">Help text</small> -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Thêm</button>

                <button type="button" class="btn btn-dark" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</form>

<?php



if (isset($_POST['txtQuestionCateName'])) {
    $error_flag = false;
    $que_cate_name = $_POST['txtQuestionCateName'];



    $questionCateModel = new QuestionCategoryModel();

    $allQuestionCat = $questionCateModel->all();
    $que_cate_id = randomString(10);


    foreach ($allQuestionCat as $cat) {
        if ($cat['que_cate_id'] == $que_cate_id) {
            echo "<script>
            Swal.fire({
                icon: 'error',
                title: 'Mã đã tồn tại!',
                showConfirmButton: false,
                timer: 2000
              });
            </script>";
            $error_flag = true;
            break;
        }
        if ($cat['que_cate_name'] == $que_cate_name) {
            echo "<script>
            Swal.fire({
                icon: 'error',
                title: 'Tên loại câu hỏi đã tồn tại!',
                showConfirmButton: false,
                timer: 2000
              });
            </script>";
            $error_flag = true;
            break;
        }
    }

    if ($error_flag == false) {
        $ret = $questionCateModel->add($que_cate_id, $que_cate_name);
        if ($ret == true) {
            echo "<script>
            Swal.fire({
                icon: 'success',
                title: 'Thêm thành công!',
                showConfirmButton: false,
                timer: 1500
              });
            </script>";

            echo "<script>
            setTimeout(() => {
                location.href='/admin?action=question-category'
            }, 1500);
         </script>";
        } else {
            echo "<script>
            Swal.fire({
                icon: 'error',
                title: 'Thêm thất bại!',
                showConfirmButton: false,
                timer: 2000
              });
            </script>";
        }
    }
}


?>



<!-- ---------------------------- -->
<!-- handle Del quetion category -->
<!-- ---------------------------- -->
<?php
if (isset($_POST['btnDel'])) {
    $que_cate_id = $_POST['btnDel'];
    $questionCateModel = new QuestionCategoryModel();
    $ret = $questionCateModel->del($que_cate_id);



    if ($ret == true) {
        echo "<script>
        Swal.fire({
            icon: 'success',
            title: 'Xóa thành công!',
            showConfirmButton: false,
            timer: 1500
          });
        </script>";


        echo "<script>
        setTimeout(() => {
            location.href='/admin?action=question-category'
        }, 1500);
     </script>";
    } else {
        echo "<script>
        Swal.fire({
            icon: 'error',
            title: 'Xóa thất bại!',
            showConfirmButton: false,
            timer: 2000
          });
        </script>";
    }
}



?>

<!-- ---------------------------- -->
<!-- handle Edit quetion category -->
<!-- ---------------------------- -->

<!-- Modal  edit -->
<form method="POST" class="modal fade" id="modalEdit" tabindex="-1" aria-labelledby="modalEdit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa loại câu hỏi - <span id="old_id"></span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="btnEdit">Tên loại câu hỏi mới</label>
                    <input type="text" class="form-control d-none " name="old_id_to_post" id="old_id_to_post" aria-describedby="helpId" placeholder="">
                    <input type="text" class="form-control" name="newQueCatName" id="newQueCatName" aria-describedby="helpId" placeholder="">
                    <!-- <small id="helpId" class="form-text text-muted">Help text</small> -->
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Chỉnh sửa</button>

                <button type="button" class="btn btn-dark" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</form>


<script>
    $(document).ready(function() {
        $('#modalEdit').on('show.bs.modal', function(event) {
            var button = $(event.relatedTarget);
            var old_id = button.data('whatever');

            $('#old_id').val(old_id);
            const old_id_to_post = document.getElementById("old_id_to_post");

            const old_id_ele = document.getElementById("old_id");
            old_id_ele.innerHTML = old_id;
            $('#old_id_to_post').val(old_id);
        })
    })
</script>


<?php




if (isset($_POST['newQueCatName'])) {
    if (isset($_POST['old_id_to_post'])) {
        $que_cate_id = $_POST['old_id_to_post'];
        $new_name = $_POST['newQueCatName'];



        $questionCateModel = new QuestionCategoryModel();
        $ret = $questionCateModel->edit($que_cate_id, $new_name);


        echo $ret;
        echo "<script>location.href='/mini-q2a/admin?action=question-category'</script>";

        // if ($ret == true) {
        //     echo "<script>
        //     Swal.fire({
        //         icon: 'success',
        //         title: 'Xóa thành công!',
        //         showConfirmButton: false,
        //         timer: 1500
        //       });
        //     </script>";


        //     echo "<script>
        //     setTimeout(() => {
        //         location.href='/admin?action=question-category'
        //     }, 1500);
        //  </script>";
        // } else {
        //     echo "<script>
        //     Swal.fire({
        //         icon: 'error',
        //         title: 'Xóa thất bại!',
        //         showConfirmButton: false,
        //         timer: 2000
        //       });
        //     </script>";
        // }
    }
}


?>