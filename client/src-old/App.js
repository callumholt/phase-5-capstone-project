// import logo from "./logo.svg";
// import "./App.css";

// function App() {
//   return (
//     <div className="App">
//       <header className="App-header">
//         <img src={logo} className="App-logo" alt="logo" />
//         <p>
//           Edit <code>src/App.js</code> and save to reload!
//         </p>
//         <a
//           className="App-link"
//           href="https://reactjs.org"
//           target="_blank"
//           rel="noopener noreferrer"
//         >
//           Learn React
//         </a>
//       </header>
//     </div>
//   );
// }

// export default App;

// export default App;

import React from "react";
import LoginForm from "./login_form";
import ReactDOM from "react-dom";

function App() {
  return (
    <div className="container mt-5">
      <div className="card">
        <div className="card-header">
          <h2>Todo Application</h2>
        </div>
        <div>
          <LoginForm />
        </div>
      </div>
    </div>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));

export default App;
