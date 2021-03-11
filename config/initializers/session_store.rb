if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_univ-app', domain: 'univ-app-front-git-deploy-ka-zu-ki.vercel.app'
else
  Rails.application.config.session_store :cookie_store, key: '_univ-app'
end