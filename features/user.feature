# language: ru

Функционал: Регистрация пользователя
  Как гость
  Я хочу иметь возможность зарегестрироваться
  
  @javascript
  Сценарий: Регистрация пользователя
    Если Гость перейдет на страницу регистрации
    И заполнит поля данными
      | email        | password     | password_confirmation |
      | some@some.ru | qweqwe       | qweqwe                |
    То в навбаре отобразится его email