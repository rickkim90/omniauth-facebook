# 4차산업혁명 선도인재 양성 프로젝트 과정

---
## 1. Week 1 Day 22:   

***



rbenv install 2.4.2

rbenv local 2.4.2

gem install bundrailsler

gem install rails -v 5.1.4 —no-ri —no-rdoc





### Oauth_facebook

##### Facebook developer

특정 인정 하는것만 보내게 한다



/Users/hyunkyung/project/omniauth-facebook/.gitignore

/config/secrets.yml 추가



```ruby
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    auth = request.env['omniauth.auth']
    p auth.info.name
    redirect_to root_path
  end

end
```

Print reuqest.evn에 omniauth.auth를 출력하는 코드

console 창에 이름 출력

https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema

/users/auth/facebook/callback 요청이 오면 /users/ 에다가 매칭



user.rb

```ruby
has_many :services 추가
```



auth.provider

해당 유저가 어떤걸로 로그인했는지



devise.rb

OmniAuth에 추가

config.github..등등 추가
