# Тестирование в Ruby

Автоматизированное тестирование — неотъемлемая часть процесса программирования в профессиональной среде. Тесты — единственный надёжный способ убедиться в работоспособности кода. Они не избавляют от багов, но позволяют держать их количество на приемлемом уровне. Тесты дают уверенность, что изменения в одной части системы не сломали другие части.

Стек (англ. stack — стопка; читается стэк) — абстрактный тип данных, представляющий собой список элементов, организованных по принципу LIFO (англ. last in — first out, «последним пришёл — первым вышел»).

```ruby
stack = Stack.new
stack.to_a # []
stack.empty? # true
stack.size # 0

stack.push! 'ruby'
stack.push! 'php'
stack.push! 'java'
stack.to_a # ['ruby', 'php', 'java']
stack.size # 3
stack.empty? # false

stack.pop!
stack.to_a # ['ruby', 'php']
stack.size # 2

stack.clear!
stack.to_a # []
stack.empty? # true
```

## Ссылки

* [Minitest](http://docs.seattlerb.org/minitest/) — фреймворк тестирования
* [Начинаем писать тесты (правильно)](https://ru.hexlet.io/blog/posts/how-to-test-code)
* [Реализация Power Assert для Minitest](https://github.com/hsbt/minitest-power_assert)

## Задачи

## Gemfile

Добавьте гем `minitest-power_assert` в Gemfile и установите его:

```ruby
gem install 'minitest-power_assert'
```

### test/stack_test.rb

Напишите тесты для реализации стека. Должны быть протестированы методы:

* добавления  элемента
* удаления элемента
* очистки стека
* проверки стека на пустоту

Используйте PowerAssert утверждения.

## Подсказки

* Что такое Stack: [Stack](https://ru.wikipedia.org/wiki/%D0%A1%D1%82%D0%B5%D0%BA)
