// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.
require("../../assets/stylesheets/application.css.scss");
const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)