@extends('web.layouts.master')
@section('title', 'Fresh Cart')
@section('content')
    <main>
        <section class="">
            <div class="row">
                <div class="col-lg-7">
                    <h3 class="greenColor">Delivery Address</h3>
                    <div class="card rounded-card-border body-background">
                        <div class="card-body">
                            <input type="hidden" value="{{ $order->id }}" name="order_id" id="order_id">
                            <div class="form-group mb-3">
                                <label>Street</label>
                                <input type="text" name="street" class="form-control" placeholder="Enter Street" id="street">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <label>City</label>
                                    <input type="text" name="city" class="form-control mb-3 city" id="city" placeholder="Enter City">
        
                                    <label>Country</label>
                                    <input type="text" name="country" class="form-control mb-3 country" id="country" placeholder="Enter Country">
                                </div>
                                <div class="col-lg-6">
                                    <label>State</label>
                                    <input type="text" name="state" class="form-control mb-3 state" id="state" placeholder="Enter State">
        
                                    <label>Zipcode</label>
                                    <input type="text" name="zipcode" class="form-control mb-3 zip_code" id="zip_code" placeholder="Enter Zip Code">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <h3 class="greenColor">Payment</h3>
                    <div class="card rounded-card-border body-background p-3">
                        <div class="card-body">
                           <label for="">Card Holder Name</label>
                           <input type="text" name="holder_name" id="holder_name" placeholder="Enter Card Holder name" class="form-control mb-3">

                           <label for="">Card Number</label>
                           <input type="text" name="card_number" id="card_number" placeholder="Enter Card Number" class="form-control mb-3">

                           <label for="">Expiry Date</label>
                           <input type="text" name="expiry_date" id="expiry_date" data-mask-format="99/99" placeholder="Expiration (MM / YYYY)" class="form-control mb-3 expiry_date">

                           <label for="">CVV</label>
                           <input type="text" name="cvv" id="cvv" placeholder="Enter CVV" class="form-control mb-3">

                           <button class="btn backgroundColor ml-auto payment">Payment</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
@endsection

@section('script')
    <script>
        $(document).ready(function() {
            $('.expiry_date').datepicker({
                format: 'mm/yyyy',
                startView: "years",
                minViewMode: "months",
                startDate: "today",
                autoclose: true
            });

            $(".payment").on("click" , function() {
                var order_id = $("#order_id").val();
                var street = $("#street").val();
                var city  = $("#city").val();
                var state = $('#state').val();
                var country = $("#country").val();
                var zip_code = $("#zip_code").val();
                var holder_name = $("#holder_name").val();
                var card_number = $('#card_number').val();
                var expiry_date = $("#expiry_date").val();
                var cvv = $("#cvv").val();
                $.ajax({
                    url: "{{ route('card-payment') }}",
                    type: "POST",
                    data: {
                        order_id : order_id,
                        street : street,
                        city : city,
                        state : state,
                        country : country,
                        zip_code : zip_code,
                        holder_name : holder_name,
                        card_number : card_number,
                        expiry_date : expiry_date,
                        cvv : cvv,
                        _token : $('meta[name="csrf-token"]').attr("content"),
                    },
                    success : function(response){
                        if(response.status == true) {
                            window.location.href = "/order-placed";
                        }
                    }
                });
            })
        });
    </script>
@endsection