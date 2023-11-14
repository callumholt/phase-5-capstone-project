import React, { useEffect, useState } from "react";
import { Routes, Route, useHistory } from "react-router-dom";
import SignUp from "./SignUp";
import Login from "./Login";
import NavBar from "./NavBar";
import Home from "./Home";
import WorkoutProfiles from "./WorkoutProfiles";
import NewWorkout from "./NewWorkout";
import Pricing from "./Pricing";
import BuyButtonSingle from "./BuyButtonSingle";

function App() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    // auto-login
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
        console.log("the user is: ", user);
      }
    });
  }, []);

  return (
    <>
      <div>
        <NavBar user={user} setUser={setUser} />
        <div>
          <main>
            <Routes>
              {user ? (
                <>
                  <Route path="/" element={<Home user={user} />} />
                  <Route
                    path="/workouts"
                    element={<WorkoutProfiles user={user} />}
                  />
                  <Route path="/NewWorkout" element={<NewWorkout />} />
                  <Route path="/Pricing" element={<Pricing user={user} />} />
                  <Route
                    path="/BuySingle"
                    element={<BuyButtonSingle user={user} />}
                  />
                </>
              ) : (
                <>
                  <Route
                    path="/signup"
                    element={<SignUp setUser={setUser} />}
                  />
                  <Route path="/login" element={<Login setUser={setUser} />} />
                  <Route path="/" element={<Home />} />
                  <Route
                    path="/BuySingle"
                    element={<BuyButtonSingle user={user} />}
                  />
                </>
              )}
            </Routes>
          </main>
        </div>
      </div>
    </>
  );
}

export default App;
