Here is an example for a typical model class using `dart_mappable`:

```dart
// This file is "model.dart"
import 'package:dart_mappable/dart_mappable.dart';

// required: associates our `models.dart` with the code generated by dart_mappable
part 'model.mapper.dart';

@MappableClass()
class Person with PersonMappable {
  
  final String firstName;
  final String lastName;
  final int age;
  
  const Person({
    required this.firstName, 
    required this.lastName, 
    required this.age,
  });

  // optional: links deserialization factories from the generated [PersonMapper] class
  static final fromMap = PersonMapper.fromMap;
  static final fromJson = PersonMapper.fromJson;
}
```

From this example we can notice a few things:

- We can define the fields and constructor of our class as usual. `dart_mappable` does not
  require any special syntax for defining our models, which makes it easier to plug into an existing class. 

- It is required that we annotate our model with `@MappableClass`. This is what tells 
  `dart_mappable` to generate code for this class.
  
- We must apply a mixin with in the form `<ClassName>Mappable`. This mixin is what defines the 
  various properties/methods of our model.
  
- We **can** add some optional `fromMap` and `fromJson` methods. This is just a style choice you can make,
  which enables you to call `Person.fromMap` (or `fromJson`) instead of the default `PersonMapper.fromMap` when
  deserializing your model (more about that later).
  
## Generated Code

When running code-generation, the following two objects will be generated for each annotated class:

1. A `<ClassName>Mapper` class (e.g. `PersonMapper`). 
2. A `<ClassName>Mappable` mixin (e.g. `PersonMappable`).

The `Mapper` class is what contains all the implementation logic. Having the implementation separate from
the model class itself is what makes `dart_mappable` so modular and customizable later on. However
in most cases, we don't need to worry about this class at all, since it is abstracted by the generated **mixin**.

The generated `Mappable` mixin will have the following methods:

- `toMap()` and `toJson()` to serialize your model,
- `copyWith()` to create copies of your model with different properties (see [Copy With](../topics/Copy-With-topic.html)),
- `toString()` override to print all properties of your model,
- `operator ==` and `hashCode` overrides.

## Annotation Properties

The following configuration options exist for the `@MappableClass()` annotation:

- `caseStyle`: Sets the case style for the json keys (See [Case Style](../topics/Configuration-topic.html#case-styles)).
- `ignoreNull`: Whether to ignore all json keys with null values.
- `discriminatorKey` and `discriminatorValue`: See [Polymorphism](../topics/Polymorphism-topic.html).
- `hooks`: See [Mapping Hooks](../topics/Mapping%20Hooks-topic.html).
- `generateMethods`: Toggle generation of specific methods on or off (See [Generation Methods](../topics/Configuration-topic.html#generation-methods)). 
- `includeSubClasses`: See [Polymorphism](../topics/Polymorphism-topic.html).
- `includeCustomMappers`: See [Custom Mappers](../topics/Custom%20Mappers-topic.html).

### Changing Constructors

For deserialization, `dart_mappable` will use the first available constructor of a class, but you
can use a specific constructor using the `@MappableConstructor()` annotation.

```dart
@MappableClass()
class MyClass with MyClassMappable {
  MyClass(); // Don't use this
  
  @MappableConstructor()
  MyClass.special(); // Use this
}
```

### Annotating Fields

You can also annotate a single field or constructor parameter of a class using `@MappableField()`
to set a specific json key or add custom [Mapping Hooks](../topics/Mapping%20Hooks-topic.html).

```dart
@MappableClass()
class MyClass with MyClassMappable {
  MyClass(this.value);

  @MappableField(key: 'my_key')
  String value;
}
```

***Note**: This can only be used on a field if it is directly assigned as a constructor parameter (`MyClass(this.myField)`).
Setting this annotation on any other field will have no effect. (Read [Utilizing Constructors](#utilizing-constructors) 
for an explanation why this is.)*

## Utilizing Constructors

There exist a lot of custom use cases when it comes to mapping json to an object. Common ones include:

- providing **default values** to optional fields,
- **ignoring** fields,
- **renaming** fields,
- **custom formats** for dates or numbers,
- **computing values**,
- ... and lots more.

Instead of providing custom tailored serialization options for some selected use-cases, this package
utilizes the power of constructor arguments to cover all of them. Thereby, you keep full control
over your models, while writing pure and easy dart code.

***How does that work exactly?** When analysing your code, `dart_mappable` never looks at the fields
of your model, but rather only at the constructor arguments. What you do with them - writing to
fields, renaming, etc. - is up to your model's implementation.*

To illustrate this, here are some examples for the above mentioned use cases:

```dart
@MappableClass()
class Person with PersonMappable {
  String name;
  int age;
    
  // basic example, nothing special going on
  Person.base(this.name, this.age);
  
  // setting default values for some parameters
  Person.opt(this.name, [this.age = 18]);

  // renamed argument, will be {"years": ...} in json
  Person.renamed(this.name, int years) : age = years;
  // IMPORTANT: when renaming arguments, make sure to always have a matching getter for serialization (*)
  int get years => age;
  
  // ignores the age field completely
  Person.ignored(this.name);
 
  // computed name value
  Person.computed(String firstName, String lastName, this.age) : name = '$firstName $lastName';
  // IMPORTANT (again): have matching getters for all arguments, reversing the computed value (*)
  String get firstName => name.split(' ')[0];
  String get lastName => name.split(' ')[1];
}
```

***(\*) Regarding the matching getters:** Not-having them won't break your code.
However this will lead to desynched serialization (keys missing in your json) and eventually to
errors when trying to deserialize back. You will also get a warning in the builder output to know
when this happens.*

***Remember**: dart_mappable will always use the first constructor it sees, but you can use a specific
constructor using the `@MappableConstructor()` annotation.*

---

<p align="right"><a href="../topics/Enums-topic.html">Next: Enums</a></p>