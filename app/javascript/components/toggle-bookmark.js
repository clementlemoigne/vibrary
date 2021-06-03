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
          });
        })
      }
    });
  });
}

export {toggleBookmark}
