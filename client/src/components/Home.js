import React, { useState } from "react";
import { Configuration, OpenAIApi } from "openai";
import OpenAI from "openai";

function Home({ user }) {
  const [formData, setFormData] = useState({
    name: "",
    userId: "",
    goal: "",
    experience: "beginner",
    sessionsPerWeek: "",
    sessionDuration: "",
    injuries: "",
  });
  const [respFromOpenA, setRespFromOpenAi] = useState({});

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    const openAiCall = "/workouts/openai";

    const prompt = `Create a workout plan for ${formData.sessionsPerWeek} days per week, each session lasting ${formData.sessionDuration} minutes, considering the user is a ${formData.experience} with the following injuries: ${formData.injuries}.`;

    const prompt2 = "say this is a test";

    try {
      const response = await fetch(openAiCall);

      console.log("fetch sent");

      if (!response.ok) {
        throw new Error(
          `Network response was not ok. Status: ${response.status}`
        );
      }

      const responseData = await response.json();
      console.log("API Response:", responseData);
      setRespFromOpenAi(responseData);
    } catch (error) {
      console.error("Error:", error.message);
      console.error("Stack Trace:", error.stack);
    }
  };

  if (user) {
    return (
      <>
        <h1>Welcome, {user.name}!</h1>
        <h1>Your user id is, {user.id}!</h1>

        <form onSubmit={handleSubmit}>
          <div>
            <label>
              Name:
              <input
                type="text"
                name="name"
                value={formData.name}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              User ID:
              <input
                type="number"
                name="userId"
                value={formData.userId}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Fitness Goal:
              <input
                type="text"
                name="goal"
                value={formData.goal}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Fitness Experience:
              <select
                name="experience"
                value={formData.experience}
                onChange={handleInputChange}
              >
                <option value="beginner">Beginner</option>
                <option value="intermediate">Intermediate</option>
                <option value="advanced">Advanced</option>
              </select>
            </label>
          </div>
          <div>
            <label>
              Sessions per Week:
              <input
                type="number"
                name="sessionsPerWeek"
                value={formData.sessionsPerWeek}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Session Duration (minutes):
              <input
                type="number"
                name="sessionDuration"
                value={formData.sessionDuration}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <div>
            <label>
              Injuries:
              <input
                type="text"
                name="injuries"
                value={formData.injuries}
                onChange={handleInputChange}
              />
            </label>
          </div>
          <button type="submit">Submit</button>
        </form>
      </>
    );
  } else {
    return <h1>Please Login or Sign Up</h1>;
  }
}

export default Home;
