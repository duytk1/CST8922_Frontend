window.API_BASE_URL = '';

function loadConfig(callback) {
  fetch('/config.json')
    .then(response => response.json())
    .then(config => {
      window.API_BASE_URL = config.API_BASE_URL;
      console.log("Loaded API_BASE_URL:", window.API_BASE_URL);
      if (callback) callback();
    })
    .catch(error => {
      console.error("Failed to load config.json", error);
    });
}
