# language: ru

Функционал: Управление товарами
  Как администратор
  Я хочу иметь возможность управлять товарами
  Чтобы добавлять, удалять, редактировать товары

  @javascript
  Сценарий: Создание товара, редактирование и удаление товара
    Допустим залогинен пользователь с email "test@admin.com" и паролем "adminadmin"
    Если создаст товар с данными:
      | title     | description      | price | place      |
      | Some item | Some description | 500   | test place |
    То товар "Some item" видно в списке товаров

    Если отредактирует товар "Some item" с данными:
      | title            | description            | price | place      |
      | Some edited item | Some edted description | 600   | test place |
    То отредактированный товар  "Some edited item" видно в списке товаров

    Если удалит товар "Some edited item"
    То товар "Some edited item" не видно в списке товаров