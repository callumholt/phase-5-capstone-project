import React from "react";

function BuyButtonSingle() {
  // Paste the stripe-buy-button snippet in your React component
  return (
    <div>
      <h2>buy below:</h2>
      <stripe-buy-button
        buy-button-id="buy_btn_1OC68ALdLQbSE7KKA7A6xdzz"
        publishable-key="pk_live_51JjzAZLdLQbSE7KKSYbSTnASlew56L9Hu5LY8IFG9VR9CWiVHH0yfqDsdrzT3j0WMMS2viYD7xLQlRozSJYwNl7R0047KJ59PS"
      ></stripe-buy-button>
    </div>
  );
}

export default BuyButtonSingle;
