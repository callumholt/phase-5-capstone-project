import React, { useState } from "react";
import { redirect } from "react-router-dom";

function Newdog() {
  const [nameofdog, setNameofdog] = useState("");
  const [ageofdog, setAgeofdog] = useState("");
  const [breedofdog, setBreedofdog] = useState("");
  const [bioofdog, setBioofdog] = useState("");
  const [locationpostCode, setLocationpostCode] = useState("");
  const [datesrequiredogSitting, setDatesrequiredogSitting] = useState("");
  const [idofowner, setIdofowner] = useState("");
  const [ownerid, setOwnerid] = useState("");

  function handleSubmit(e) {
    e.preventDefault();
    fetch("/dogs", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        // id_of_owner: 3,
        owner_id: ownerid,
        name_of_dog: nameofdog,
        id_of_owner: idofowner,
        age_of_dog: ageofdog,
        breed_of_dog: breedofdog,
        bio_of_dog: bioofdog,
        location_postCode: locationpostCode,
        dates_require_dogSitting: datesrequiredogSitting,
      }),
    }).then((r) => {
      if (r.ok) {
        console.log("the dog was successfully created");
        alert("New Dog Successfully created");
      } else {
        throw new Error("failed to create new dog");
      }
    });
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <h1>Please enter the information below to register your dog</h1>

        <label htmlFor="nameofdog">Name of Dog</label>
        <input
          type="text"
          id="nameofdog"
          autoComplete="off"
          value={nameofdog}
          onChange={(e) => setNameofdog(e.target.value)}
        />

        <label htmlFor="ownerid">owner id (owner_id)</label>
        <input
          type="text"
          id="ownerid"
          autoComplete="off"
          value={ownerid}
          onChange={(e) => setOwnerid(e.target.value)}
        />

        <label htmlFor="idofowner">Id of Owner</label>
        <input
          type="text"
          id="idofowner"
          autoComplete="off"
          value={idofowner}
          onChange={(e) => setIdofowner(e.target.value)}
        />

        <label htmlFor="ageofdog">Age_of_dog</label>
        <input
          type="integer"
          id="ageofdog"
          value={ageofdog}
          onChange={(e) => setAgeofdog(e.target.value)}
        />
        <label htmlFor="breedofdog">breed_of_dog</label>
        <input
          type="text"
          id="breedofdog"
          value={breedofdog}
          onChange={(e) => setBreedofdog(e.target.value)}
        />
        <label htmlFor="bioofdog">bio_of_dog</label>
        <input
          type="text"
          id="bioofdog"
          value={bioofdog}
          onChange={(e) => setBioofdog(e.target.value)}
        />

        <label htmlFor="locationpostCode">Postcode Location of Dog</label>
        <input
          type="integer"
          id="locationpostCode"
          value={locationpostCode}
          onChange={(e) => setLocationpostCode(e.target.value)}
        />
        <label htmlFor="datesrequiredogSitting">
          What dates do you require dogsitting (string)?
        </label>
        <input
          type="text"
          id="datesrequiredogSitting"
          value={datesrequiredogSitting}
          onChange={(e) => setDatesrequiredogSitting(e.target.value)}
        />
        <button type="submit">Sign Up</button>
      </form>
    </div>
  );
}

export default Newdog;
