/*
 * aperture.js should be pasted into the Developer Console
 * in a crosh window. It assumes that you have installed
 * the patched Powerline fonts from https://github.com/powerline/fonts.
 *
 * aperture.js sets up a color theme similar to the one found in this Reddit
 * post:
 * https://www.reddit.com/r/unixporn/comments/3cn5gi/tmux_is_my_wm_on_os_x/
 *
 * It's called aperture.js because it reminds me of the color scheme on the
 * computers in the Portal series!
 */


// No scrollbar
term_.prefs_.set('scrollbar-visible', false);
term_.prefs_.set('enable-bold', true);

// This font is the best.
term_.prefs_.set('font-family', 'Inconsolata for Powerline');
term_.prefs_.set('font-size', 18);

// Some shooper shweet colors
term_.prefs_.set('background-color', "#282828");
term_.prefs_.set('foreground-color', "#ccb18b");
term_.prefs_.set('cursor-color', "#ccb18b");
term_.prefs_.set('color-palette-overrides', [
    '#353535',
    '#ae4747',
    '#556b2f',
    '#daa520',
    '#6f99b4',
    '#8b7b8b',
    '#a7a15e',
    '#dddddd',
    '#666666',
    '#ee6363',
    '#9acd32',
    '#ffc125',
    '#7c96b0',
    '#d8bfd8',
    '#f0e68c',
    '#ffffff'
]);
