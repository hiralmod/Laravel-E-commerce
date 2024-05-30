function change_status(e) {
    var id = $(e).data("id");
    var table = $(e).data("table");
    Swal.fire({
        title: "Are you sure that you want to change status of this record?",
        text: "",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#28D094",
        confirmButtonText: "Yes",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.value) {

            Swal.fire("Status changed!", "Status has been changed.", "success");

            $.ajax({
                url: "/admin/change_status",
                method: "POST",
                dataType: "json",
                data: {
                    id: id,
                    table: table,
                    _token: $('meta[name="csrf-token"]').attr("content"),
                },
                success: function (response) {
                    if (response == 1) {
                        document.getElementById("status_" + id).innerHTML ='1';
                    } else if (response == 0) {
                        document.getElementById("status_" + id).innerHTML ='0';
                    }
                    $('.datatable').DataTable().ajax.reload();
                },
            });
        }
    });
}

function delete_record(e) {
    var id = $(e).data("id");
    var table = $(e).data("table");

    Swal.fire({
        title: "Are you sure that you want to delete this record?",
        text: "",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#28D094",
        confirmButtonText: "Yes",
        cancelButtonText: "No",
    }).then((result) => {
        if (result.value) {
            Swal.fire("Record Deleted!", "Record has been deleted", "success");
            $.ajax({
                url:  "/admin/delete_record",
                method: "POST",
                dataType: "json",
                data: {
                    id: id,
                    table: table,
                    _token: $('meta[name="csrf-token"]').attr("content"),
                },
                success: function (response) {
                    $('.datatable').DataTable().ajax.reload();
                },
            });
        }
    });
}

$(document).ready(function() {
    $(document).on('change','#category_id', function() {
        var category_id = this.value;
        $.ajax({
            url: "/admin/fetchSubcategory",
            type: "GET",
            data: { category_id: category_id },
            dataType: 'json',
            success: function (result) {
                $('#sub_category').html('<option value="" selected disabled>Select Sub Category</option>');
                $.each(result.subcategory, function (key, value) {
                    $("#sub_category").append('<option value="' + value.id + '">' + value.name + '</option>');
                });
            }
        });
    });
});
function allowOnlyCharacter(evt) {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (evt.target.value.length === 0 && charCode === 32) {
        return false;
    }
    if (/[a-zA-Z ]/i.test(evt.key)) {
        return true;
    }
    return false;
}

function isNumber(evt) {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function initalSpaceNotAllowed(evt) {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (evt.target.value.length === 0 && charCode === 32) {
        return false;
    }
    return true;
}

function isPrice(evt) {
    evt = evt ? evt : window.event;
    var charCode = evt.which ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

/**
 *
 * @param {*} input
 * Not allowed white space in start of the input
 */
function validate(input) {
    if (/^\s/.test(input.value)) input.value = "";
}

$(document).on("change", ".preview_file", function () {
    const file = this.files[0];
    if (file) {
        let reader = new FileReader();
        reader.onload = function (event) {
            $(".preview_img").attr("src", event.target.result);
            $(".preview_img").css("width", "100px");
            $(".preview_img").addClass("img-fluid img-thumbnail");
        };
        reader.readAsDataURL(file);
    }
});

window.ParsleyValidator.addValidator(
    "fileextension",
    function (value, requirement) {
        var fileExtension = value.split(".").pop().toLowerCase();
        var extension = requirement.split(",");
        if (jQuery.inArray(fileExtension, extension) !== -1) {
            return true;
        } else {
            return false;
        }
    },
    32
).addMessage(
    "en",
    "fileextension",
    "Please attach the valid file(%s format allowed)"
);
$(document).ready(function() {
    $('.select_dropdown').select2();

    //search & Cancel button
    $(document).on('click', '#cancel' , function(e){
        e.preventDefault();
        window.location.href =  window.location.href.split("?")[0]
        return false;
    });
});

$(document).ready(function(){
    $('.slick-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2000,
      });
});


$(document).ready(function(){
    $('.slick-card').slick({
        centerMode: true,
        lazyLoad: 'ondemand',
        slidesToShow: 6,
        autoplay: true,
        autoplaySpeed: 2000,
        arrows: true,
        responsive: [
            {
            breakpoint: 1200,
            settings: {
                slidesToShow: 4
            }
            },
            {
            breakpoint: 768,
            settings: {
                slidesToShow: 2
            }
            }
        ]
    });

    $('.sidebar-color').click(function() {
        $('.sidebar-color').removeClass('active');
        $(this).addClass('active');
    });

    new Drift(document.querySelector('.drift-demo-trigger'), {
        paneContainer: document.querySelector('.details'),
        inlinePane: 769,
        inlineOffsetY: -80,
        containInline: true,
        hoverBoundingBox: true
    });
});

$(document).on('input', "#searchInput", function() {
    var searchValue = $(this).val();
    if(searchValue.length > 0) {
        $(".searchValue").removeClass("d-none");
        $(".searchDisable").addClass("d-none");
        $.ajax({
            url : '/search-item',
            type : "POST",
            data : { 
                search : searchValue,
                _token : $('meta[name="csrf-token"]').attr("content"),
            },
            success : function(data) {
                console.log("data", data);
                var resultsContainer = $('#searchResults');
                resultsContainer.empty(); // Clear previous results
                $.each(data, function(index, product) {
                    var profilePictureUrl = "/storage" + product.profile_picture.substring(6);
                    var card = `
                        <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                            <div class="card card-popular-product border rounded mr-2">
                                <div class="card-body">
                                    <div class="text-center position-relative">
                                        <div class="position-absolute top-0 left-0"></div>
                                        <a href="/product-details/${product.category_id}/${product.subcategory_id}/${product.id}">
                                            <img src="${profilePictureUrl}" alt="Product Image" class="img-fluid">
                                        </a>
                                    </div>
                                    <a href="/product-details/${product.category.id}/${product.subcategory.id}/${product.id}">
                                        <h4 class="fs-5">${product.name}</h4>
                                    </a>
                                    <p class="mt-1 text-dark text-decoration-none">${product.quantity}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="text-dark">₹ ${product.price}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `;
                    resultsContainer.append(card);
                });
            }
        })
    } else {
        $(".searchValue").addClass("d-none");
        $(".searchDisable").removeClass("d-none");
        $(".searchValue").val("");
    }
})

// function showQuantity() {
//     document.querySelector(".addContainer").style.display = "none";
//     document.querySelector(".quantityContainer").style.display = "block";
// }

// $(document).ready(function() {
//     updateCartCounter();
//     // Check if quantity is stored in localStorage for each product
//     $('.quantity-btn').each(function() {
//         var productId = $(this).data('id');
//         var quantity = localStorage.getItem('quantity_' + productId);
//         if (quantity) {
//             $(this).removeClass('d-none');
//             $(this).siblings('.add-cart').addClass('d-none');
//             $(this).find('.quantity').text(quantity);
//         }
//     });

//     // Add to cart logic
//     $(document).on('click', '.add-cart', function() {
//         var productId = $(this).siblings('.quantity-btn').data('id');
//         var quantity = localStorage.getItem('quantity_' + productId) || 0;
//         quantity = parseInt(quantity) + 1;
//         localStorage.setItem('quantity_' + productId, quantity);
//         $(this).siblings('.quantity-btn').removeClass('d-none');
//         $(this).addClass('d-none');
//         $(this).siblings('.quantity-btn').find('.quantity').text(quantity);
//         updateCartCounter();
//     });

//     // Increase quantity logic
//     $(document).on('click', '.quantity-add', function() {
//         var productId = $(this).closest('.quantity-btn').data('id');
//         var quantity = parseInt(localStorage.getItem('quantity_' + productId)) || 0;
//         if (quantity < 5) {
//             quantity++;
//             localStorage.setItem('quantity_' + productId, quantity);
//             $(this).siblings('.quantity').text(quantity);
//             updateCartCounter();
//         }
//     });

//     // Decrease quantity logic
//     $(document).on('click', '.quantity-minus', function() {
//         var productId = $(this).closest('.quantity-btn').data('id');
//         var quantity = parseInt(localStorage.getItem('quantity_' + productId)) || 0;
//         if (quantity > 1) {
//             quantity--;
//             localStorage.setItem('quantity_' + productId, quantity);
//             $(this).siblings('.quantity').text(quantity);
//         } else if (quantity == 1) {
//             // localStorage.removeItem('quantity');
//             localStorage.removeItem('quantity_' + productId);
//             $('.add-cart').removeClass('d-none');
//             // $(this).siblings('.add-cart').removeClass('d-none');
//             // $(this).addClass('d-none');
//             $('.quantity-btn').addClass('d-none');
//             updateCartCounter();
//         }
// });

//     function updateCartCounter() {
//         var uniqueProducts = 0;
//         for (var key in localStorage) {
//             if (key.startsWith('quantity_')) {
//                 uniqueProducts++;
//             }
//         }
        
//         $('#cart-counter').text(uniqueProducts);
//         if (uniqueProducts > 0) {
//             $('#cart-counter').removeClass('d-none');
//         } else {
//             $('#cart-counter').addClass('d-none');
//         }
//     }
// });