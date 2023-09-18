<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <title>Document</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Carter+One&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="assets/css/payment.css" />
  </head>
<body>

<jsp:include page="header.jsp"></jsp:include>

 
    <h1>Payment Page</h1>
    <h3 id="address_head">Address Details</h3>
    <form id="payment_form">
      <label for="fname"
        >Name
        <input id="fname" type="text" required /> </label
      ><br />
      <br /><br />

      <label for="Email"
        >Email Address
        <input id="email" type="text" required /> </label
      ><br />
      <br /><br />

      <label for="number"
        >Phone Number
        <input id="phone_num"   autocomplete="off"
        
        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
        type="number"
        maxlength="10"
        minlength="10"
        inputmode="numerical"
        placeholder="9876543210"
        type="number"
        data-pattern-validatetype="number" required />
        <br /><br /></label
      ><br />
      
   

      <label for="Address">
        Delivery Address
        <input id="address" type="text" required /> </label
      ><br />
      <br /><br />

      <label for="City"
        >City
        <input id="city" type="text" required /> </label
      ><br />
      <br /><br />

      <label for="pincode"
        >Pincode
        <input id="pincode"   autocomplete="off"
        
        oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
        type="number"
        maxlength="6"
        inputmode="numerical"
        placeholder="xxxxxx"
        type="number"
        data-pattern-validatetype="number" required /> </label
      ><br />
      <br /><br />
      

      <!-- <div class="last">
            <a href="payment2.html" id="submit">Next</a>
          </div> -->
    </form>

    <div class="container">
      <div class="payment">
        <h3>Select a payment method</h3>
        <a class="card pay click">
          <img src="../../assests/images/card icon.png" alt="card" />
          <div class="card para">
            <h2>Card</h2>
            <h4>Visa, Mastecard, RuPay and Maestro</h4>
          </div>
        </a>

        <div class="card_details">
          <label for="number"
            >Card number
            <input
            autocomplete="off"
            id="card_number"
            oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
            type="number"
            maxlength="16"
            minlength="16"
            inputmode="numerical"
            placeholder="1234 1234 1234 1234"
            type="number"
            data-pattern-validate
            />
</label
          ><br />
          <br />
          <div class="div">
            <p>Expiry Date</p>
            <div class="expiry_date">
              <input
              autocomplete="off"
                  id="month"
              oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
              type="number"
              maxlength="2"
            minlength="2"

              inputmode="numerical"
              placeholder="MM"
              type="number"
              data-pattern-validate
              />

              <input
                autocomplete="off"
                id="year"
                oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                type="number"
                maxlength="2"
            minlength="2"

                inputmode="numerical"
                placeholder="YY"
                type="number"
                data-pattern-validate
              />
            </div>

            <p>CVV</p>

            <div class="cvc">
              <input
              autocomplete="off"
                id="cvv"
                oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
                type="number"
                maxlength="3"
                inputmode="numerical"
                placeholder="123"
                type="number"
                data-pattern-validate
              />
            </div>
          </div>
          <button id="place_order_button">Pay ₹ <span class="rs"> 0 </span></button>
        </div>

        <div class="other_apps">
          <div class="paylater pay">
            <img src="../../assests/images/cod.jpg" alt="cod" />
            <div class="upi para">
              <h2>Cash on Delivery</h2>
              <h4>Pay at your Doorstep.</h4>
            </div>
          </div>
          <div class="cash_delivery">
            <p>
              By choosing cash on delivery, You can pay at your Door Step after
              receiving the product
            </p>
            <button id="cash_btn">Confirm Order</button>
          </div>
          <div class="upipay pay">
            <img src="../../assests/images/UPI_icon.png" alt="upi" />
            <div class="upi para">
              <h2>UPI</h2>
              <h4>Pay with installed app, or use others</h4>
            </div>
          </div>
          <div class="upi_trans">
            <div class="icons">
              <img
                id="gpay"
                src="../../assests/images/gpay_icon.png"
                alt="gpay"
              />
              <img
                id="paytm"
                src="../../assests/images/paytm_logo.png"
                alt="paytm"
              />
              <img src="assets/images/phonepe.png" alt="phonepe" />
            </div>
            <label for="upi_id"
              >Enter your UPI Id
              <input type="email" id="upi_id" placeholder="robert@oksbibank"
            /></label>

            <p>Place Order</p>
          </div>
        </div>
      </div>

      <div class="pro_details">
        <h2>Price details</h2>
        <hr />
        <div class="price">
          <p>Price ( <span id="num_items"> 1 </span> item)</p>
          <p>₹<span class="rs">200</span></p>
        </div>
        <div class="delivery_charges">
          <p>Delivery Charges</p>
          <p>FREE</p>
        </div>
        <hr />
        <div class="amount_payable">
          <p>Total Amount Payable</p>
          <p>₹<span class="rs">200</span></p>
        </div>
      <a  id="order_history" href="/pages/order.html">Want to see Order history?</a>

      </div>
    </div>
</body>
</html>



  