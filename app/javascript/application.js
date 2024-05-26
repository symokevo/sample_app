// Configure your import map in config/importmap.rb.
// Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "custom/menu"
import "custom/image_upload"
import "popper"
import "bootstrap"

// app/javascript/packs/application.js

document.addEventListener("DOMContentLoaded", function() {
  const navbarHeight = document.querySelector(".navbar.fixed-top").offsetHeight;
  document.body.style.paddingTop = `${navbarHeight}px`;
});
