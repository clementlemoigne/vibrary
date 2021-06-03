import {csrfToken} from "@rails/ujs"

const toggleBookmark = () => {
  // let bookmarksPlain = document.querySelectorAll(".bookmark-plain")
  // let bookmarksEmpty = document.querySelectorAll(".bookmark-empty")
  const bookmarks = document.querySelectorAll(".bookmark");
  bookmarks.forEach((bookmark) => {
    bookmark.addEventListener("click", () => {
      if (bookmark.dataset.id) {
        fetch(`/favorites/${bookmark.dataset.id}`, {
          method: 'DELETE',
          headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() }
        })
        .then(response => response.json())
        .then(() => {
          const bookmarksToChange = document.querySelectorAll(`[data-story-id="${bookmark.dataset.storyId}"]`);
          bookmarksToChange.forEach((bookmarkToChange) => {
            bookmarkToChange.removeAttribute('data-id');
            const iToChange = bookmarkToChange.firstElementChild;
            iToChange.classList.remove("fas");
            iToChange.classList.add("far");
            // bookmarkToChange.innerHTML = '<i class="story-card-icone far fa-bookmark "></i>';
          });
        })
      }
      else {
        fetch(`/stories/${bookmark.dataset.storyId}/favorites`, {
          method: 'POST',
          headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() }
        })
        .then(response => response.json())
        .then((data) => {
          console.log(data.id);
          const bookmarksToChange = document.querySelectorAll(`[data-story-id="${bookmark.dataset.storyId}"]`);
          bookmarksToChange.forEach((bookmarkToChange) => {
            bookmarkToChange.dataset.id = data.id
            const iToChange = bookmarkToChange.firstElementChild;
            iToChange.classList.remove("far");
            iToChange.classList.add("fas");
            // bookmarkToChange.innerHTML = '<i class="story-card-icone fas fa-bookmark "></i>';
          });
        })
      }
    });
  });

  // console.log(bookmarksPlain);
  // bookmarksPlain.forEach((bookmark) => {
  //   bookmark.addEventListener("click", (event) => {
  //     console.log(bookmark)
  //     fetch(`/favorites/${bookmark.id}`, {
  //       method: 'DELETE',
  //       headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken()}
  //     })
  //       .then(response => response.json())
  //       .then((x) => {
  //         bookmark.removeAttribute('dataset-id');
  //         bookmark.className = "bookmark-empty";
  //         bookmark.innerHTML = '<i class="story-card-icone far fa-bookmark "></i>';
  //       })
  //   });
  // });

  // bookmarksEmpty.forEach((bookmarkEmpty) => {
  //   bookmarkEmpty.addEventListener("click", (event) => {
  //     console.log(bookmarkEmpty)
  //     fetch(`/stories/${bookmarkEmpty.dataset.storyId}/favorites`, {
  //       method: 'POST',
  //       headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken()}
  //     })
  //       .then(response => response.json())
  //       .then((data) => {
  //         console.log(data.id);
  //         bookmarkEmpty.dataset.id = data.id;
  //         bookmarkEmpty.className = "bookmark-plain";
  //         bookmarkEmpty.innerHTML = '<i class="story-card-icone fas fa-bookmark "></i>';
  //       })
  //       .then(() => {
  //         bookmarksPlain = document.querySelectorAll(".bookmark-plain")
  //         bookmarksEmpty = document.querySelectorAll(".bookmark-empty")
  //         console.log(bookmarksPlain);
  //       })
  //   });
  // });
}

export {toggleBookmark}
