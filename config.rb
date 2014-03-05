set :source, 'website'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :build_dir, 'build'

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :relative_assets
  set :relative_links, true
end

ready do
  sprockets.append_path '../src'
end
