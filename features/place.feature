# language: ru

Функционал: Управление заведениями
  Как администратор
  Я хочу иметь возможность управлять заведениями
  Чтобы добавлять, удалять, редактировать заведения

  @javascript
  Сценарий: Создание заведения
    Допустим залогинен пользователь с email "test@admin.com" и паролем "adminadmin"
    Если создаст заведение с данными:
      | title     | description      |
      | Some place| Some description |
    То заведение "Some place" видно в списке заведений
      Если отредактирует заведение "Some place" с данными:
        | title             | description            |
        | Some edited place | Some edited description|
      То отредактированное заведение "Some edited place" видно в списке заведений
        Если удалит заведение "Some edited place"
        То заведение "Some edited place" не видно в списке заведений
