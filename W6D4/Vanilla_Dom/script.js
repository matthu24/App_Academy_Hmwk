document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const handleFavoriteSubmit = (e) => {
    e.preventDefault();

    const favoriteInput = document.querySelector(".favorite-input");
    const favorite = favoriteInput.value;
    favoriteInput.value = "";

    const newListLi = document.createElement("li");
    newListLi.textContent = favorite;

    const List = document.getElementById("sf-places");
    List.appendChild(newListLi);
  };

  const listSubmitButton = document.querySelector(".favorite-submit");
  listSubmitButton.addEventListener("click", handleFavoriteSubmit);

  // --- your code here!



  // adding new photos

  // --- your code here!



   const handlePhotoSubmit = (e) => {
     e.preventDefault();

     const photoUrlInput = document.querySelector(".photo-url-input");
     const photoUrl = photoUrlInput.value;
     photoUrlInput.value = "";

     const newImg = document.createElement("img");
     newImg.src = photoUrl;

     const newPhotoLi = document.createElement("li");
     newPhotoLi.appendChild(newImg);

     const dogPhotosList = document.querySelector(".dog-photos");
     dogPhotosList.appendChild(newPhotoLi);
   };

   const photoSubmitButton = document.querySelector(".photo-url-submit");
   photoSubmitButton.addEventListener("click", handlePhotoSubmit);
 });
