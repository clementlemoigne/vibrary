import { csrfToken } from "@rails/ujs"

const toggleFavoriteAuthor = () => {
  const favoriteAuthor = document.querySelector(".favorite-author");
  if (favoriteAuthor) {
    favoriteAuthor.addEventListener("click", () => {
      if (favoriteAuthor.dataset.id) {
          fetch(`/favorite_authors/${favoriteAuthor.dataset.id}`, {
            method: 'DELETE',
            headers: {
              'Accept': "application/json",
              'X-CSRF-Token': csrfToken()
            }
          })
          .then(response => response.json())
          .then(() => {
            const favoriteAuthorToChange = document.querySelector(`[data-author-id="${favoriteAuthor.dataset.authorId}"]`);
            favoriteAuthorToChange.removeAttribute('data-id');
            const iToChange = favoriteAuthorToChange.firstElementChild;
            iToChange.classList.remove("fas");
            iToChange.classList.add("far");
          })
        }
      else {
        fetch(`/authors/${favoriteAuthor.dataset.authorId}/favorite_authors`, {
            method: 'POST',
            headers: {
              'Accept': "application/json",
              'X-CSRF-Token': csrfToken()
              }
            })
            .then(response => response.json())
            .then((data) => {
              // console.log(data.id);
              const favoriteAuthorToChange = document.querySelector(`[data-author-id="${favoriteAuthor.dataset.authorId}"]`);
              // console.log(favoriteAuthorToChange);

              favoriteAuthorToChange.dataset.id = data.id;
              const iToChange = favoriteAuthorToChange.firstElementChild;
              iToChange.classList.remove("far");
              iToChange.classList.add("fas");
            })
          }
        });
    }
}

export { toggleFavoriteAuthor }
