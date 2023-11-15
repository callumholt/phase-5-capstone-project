import React from "react";

function Pricing() {
  const handleStripeRedirect = (priceId) => {
    // Implement the logic to create a checkout session with Stripe's API
    // and redirect the user to the Stripe Checkout page.
  };

  return (
    <div className="pricing-container">
      <div className="pricing-card">
        <h2>Single License</h2>
        <p>$89/per month</p>
        {/* Other details... */}
        {/* <button onClick={() => handleStripeRedirect("price_1")}>
          Get Started
        </button> */}
        {/* <stripe-buy-button
          buy-button-id="buy_btn_1OC68ALdLQbSE7KKA7A6xdzz"
          publishable-key="pk_live_51JjzAZLdLQbSE7KKSYbSTnASlew56L9Hu5LY8IFG9VR9CWiVHH0yfqDsdrzT3j0WMMS2viYD7xLQlRozSJYwNl7R0047KJ59PS"
        ></stripe-buy-button> */}
        <stripe-buy-button
          buy-button-id="buy_btn_1OCfYULdLQbSE7KKtvmsl0tW"
          publishable-key="pk_test_51JjzAZLdLQbSE7KKKWKJV2RvfYwXsrPduRfBCVElxKF2f4aM67w8dcqGVIJbGFrTl87Wc6CgbqzyEw7XJQGow02q00shJFUjTN"
        ></stripe-buy-button>
      </div>
      <div className="pricing-card">
        <h2>Business License</h2>
        <p>$149/per month</p>
        {/* Other details... */}
        <button onClick={() => handleStripeRedirect("price_2")}>
          Get Started
        </button>
      </div>
    </div>
  );
}

export default Pricing;
