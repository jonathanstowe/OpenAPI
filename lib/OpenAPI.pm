
use JSON::Name;
use JSON::Class;

class OpenAPI does JSON::Class {

    class License does JSON::Class {
        has Str $.name;
        has Str $.url;
    }

    class Contact does JSON::Class {
        has Str $.name;
        has Str $.url;
        has Str $.email;
    }

    class Info does JSON::Class {
        has Str     $.title  is required;
        has Str     $.description;
        has Str     $.terms  is json-name('termsOfService');
        has Contact $.contact;
        has License $.license;
        has Version $.version is required;
    }

    role TypeDescription {
        has         $.multipleOf;
        has  Num    $.maximum;
        has  Bool   $.exclusiveMaximum;
        has  Num    $.minimum;
        has  Bool   $.exclusiveMinimum;
        has  Int    $.maxLength;
        has  Int    $.minLength;
        has  Str    $.pattern;
        has  Int    $.maxItems;
        has  Int    $.minItems;
        has  Bool   $.uniqueItems;
        has         $.enum;
        has  Int    $.maxProperties;
        has  Int    $.minProperties;
    }

    class Schema does TypeDescription does JSON::Class {
        has Str     $.ref is json-name('$ref');
        has Str     $.type;
        has Str     $.format;
        has Str     $.title;
        has Str     $.description;
        has Bool    $.required;
    }

    class Items is Schema does JSON::Class {
    }

    # or an enum?
    subset CollectionFormat of Str where 'csv'|'ssv'|'tsv'|'pipes'|'multi';

    class Parameter does JSON::Class does TypeDescription {
        has Str     $.name          is required;
        has Str     $.in            is required; # Possible values are "query", "header", "path", "formData" or "body".
        has Str     $.description;
        has Bool    $.required;
        has Schema  $.schema;
        has Str     $.type;         # "string", "number", "integer", "boolean", "array" or "file"
        has Str     $.format;
        has Bool    $.allow-empty-value is json-name('allowEmptyValue');
        has Items   $.items;
        has CollectionFormat $.collection-format is json-name('collectionFormat');
        has         $.default;

    }


    class Operation does JSON::Class {
        has Str                     @.tags;
        has Str                     $.summary;
        has Str                     $.description;
        has ExternalDocumentation   $.external-docs is json-name('externalDocs');
        has Str                     $.operation-id  is json-name('operationId');
        has Str                     @.consumes;
        has Str                     @.produces;
        has Parameter               @.parameters;
    }

    class PathItem does JSON::Class {
        has Str $.ref is json-name('$ref');
        has Operation $.get;
        has Operation $.put;
        has Operation $.post;
        has Operation $.delete;
        has Operation $.options;
        has Operation $.head;
        has Operation $.patch;

    }

    has Version $.swagger;
    has Info    $.info;
    has Str     $.host;
    has Paths   $.paths;
    has Str     $.basePath;
    has Str     @.consumes;
    has Str     @.schemes;
    has Str     @.produces;

    has Definitions $.definitions;

    class Parameter does JSON::Class {
        has Str $.name;
        has Str $.description;
        has Str $.type;
        has Bool $.required;
        has Str $.in;
        has Str $.format;
    }
    class Schema does JSON::Class {
        has Str $.schema$ref is json-name('$ref');
    }
    class Default does JSON::Class {
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        has Schema $.schema;
        has Str $.description;
    }
    class X-next does JSON::Class {
        has Str $.type;
        has Str $.description;
    }
    class Headers does JSON::Class {
        class X-next does JSON::Class {
            has Str $.type;
            has Str $.description;
        }
        has X-next $.headersx-next is json-name('x-next');
    }
    class 200 does JSON::Class {
        class X-next does JSON::Class {
            has Str $.type;
            has Str $.description;
        }
        class Headers does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            has X-next $.headersx-next is json-name('x-next');
        }
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        has Headers $.headers;
        has Schema $.schema;
        has Str $.description;
    }
    class Responses does JSON::Class {
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        class Default does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class X-next does JSON::Class {
            has Str $.type;
            has Str $.description;
        }
        class Headers does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            has X-next $.headersx-next is json-name('x-next');
        }
        class 200 does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Headers $.headers;
            has Schema $.schema;
            has Str $.description;
        }
        has 200 $.responses200 is json-name('200');
        has Default $.default;
    }
    class Get does JSON::Class {
        class Parameter does JSON::Class {
            has Str $.name;
            has Str $.description;
            has Str $.type;
            has Bool $.required;
            has Str $.in;
            has Str $.format;
        }
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        class Default does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class X-next does JSON::Class {
            has Str $.type;
            has Str $.description;
        }
        class Headers does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            has X-next $.headersx-next is json-name('x-next');
        }
        class 200 does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Headers $.headers;
            has Schema $.schema;
            has Str $.description;
        }
        class Responses does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class 200 does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Headers $.headers;
                has Schema $.schema;
                has Str $.description;
            }
            has 200 $.responses200 is json-name('200');
            has Default $.default;
        }
        has Str $.operationId;
        has  @.tags;
        has Parameter @.parameters;
        has Str $.summary;
        has Responses $.responses;
    }
    class 201 does JSON::Class {
        has Str $.description;
    }
    class Post does JSON::Class {
        class 201 does JSON::Class {
            has Str $.description;
        }
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        class Default does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class Responses does JSON::Class {
            class 201 does JSON::Class {
                has Str $.description;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            has 201 $.responses201 is json-name('201');
            has Default $.default;
        }
        has Str $.operationId;
        has  @.tags;
        has Str $.summary;
        has Responses $.responses;
    }
    class /pets does JSON::Class {
        class Parameter does JSON::Class {
            has Str $.name;
            has Str $.description;
            has Str $.type;
            has Bool $.required;
            has Str $.in;
            has Str $.format;
        }
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        class Default does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class X-next does JSON::Class {
            has Str $.type;
            has Str $.description;
        }
        class Headers does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            has X-next $.headersx-next is json-name('x-next');
        }
        class 200 does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Headers $.headers;
            has Schema $.schema;
            has Str $.description;
        }
        class Responses does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class 200 does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Headers $.headers;
                has Schema $.schema;
                has Str $.description;
            }
            has 200 $.responses200 is json-name('200');
            has Default $.default;
        }
        class Get does JSON::Class {
            class Parameter does JSON::Class {
                has Str $.name;
                has Str $.description;
                has Str $.type;
                has Bool $.required;
                has Str $.in;
                has Str $.format;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class 200 does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Headers $.headers;
                has Schema $.schema;
                has Str $.description;
://raw.githubusercontent.com/OAI/OpenAPI-Specification/master/examples/v2.0/json/petstore.json>>>>>> 172373fe6ef953d7b9188c6989fc68c568ac0884
            }
            class Responses does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class 200 does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    class Headers does JSON::Class {
                        class X-next does JSON::Class {
                            has Str $.type;
                            has Str $.description;
                        }
                        has X-next $.headersx-next is json-name('x-next');
                    }
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Headers $.headers;
                    has Schema $.schema;
                    has Str $.description;
                }
                has 200 $.responses200 is json-name('200');
                has Default $.default;
            }
            has Str $.operationId;
            has  @.tags;
            has Parameter @.parameters;
            has Str $.summary;
            has Responses $.responses;
        }
        class 201 does JSON::Class {
            has Str $.description;
        }
        class Post does JSON::Class {
            class 201 does JSON::Class {
                has Str $.description;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class Responses does JSON::Class {
                class 201 does JSON::Class {
                    has Str $.description;
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                has 201 $.responses201 is json-name('201');
                has Default $.default;
            }
            has Str $.operationId;
            has  @.tags;
            has Str $.summary;
            has Responses $.responses;
        }
        has Get $.get;
        has Post $.post;
    }
    class /pets/{petId} does JSON::Class {
        class Parameter does JSON::Class {
            has Str $.name;
            has Str $.description;
            has Str $.type;
            has Bool $.required;
            has Str $.in;
        }
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        class Default does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class 200 does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class Responses does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class 200 does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            has 200 $.responses200 is json-name('200');
            has Default $.default;
        }
        class Get does JSON::Class {
            class Parameter does JSON::Class {
                has Str $.name;
                has Str $.description;
                has Str $.type;
                has Bool $.required;
                has Str $.in;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class 200 does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class Responses does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class 200 does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                has 200 $.responses200 is json-name('200');
                has Default $.default;
            }
            has Str $.operationId;
            has  @.tags;
            has Parameter @.parameters;
            has Str $.summary;
            has Responses $.responses;
        }
        has Get $.get;
    }
    class Paths does JSON::Class {
        class Parameter does JSON::Class {
            has Str $.name;
            has Str $.description;
            has Str $.type;
            has Bool $.required;
            has Str $.in;
            has Str $.format;
        }
        class Schema does JSON::Class {
            has Str $.schema$ref is json-name('$ref');
        }
        class Default does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Schema $.schema;
            has Str $.description;
        }
        class X-next does JSON::Class {
            has Str $.type;
            has Str $.description;
        }
        class Headers does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            has X-next $.headersx-next is json-name('x-next');
        }
        class 200 does JSON::Class {
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            has Headers $.headers;
            has Schema $.schema;
            has Str $.description;
        }
        class Responses does JSON::Class {
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class 200 does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Headers $.headers;
                has Schema $.schema;
                has Str $.description;
            }
            has 200 $.responses200 is json-name('200');
            has Default $.default;
        }
        class Get does JSON::Class {
            class Parameter does JSON::Class {
                has Str $.name;
                has Str $.description;
                has Str $.type;
                has Bool $.required;
                has Str $.in;
                has Str $.format;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class 200 does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Headers $.headers;
                has Schema $.schema;
                has Str $.description;
            }
            class Responses does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class 200 does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    class Headers does JSON::Class {
                        class X-next does JSON::Class {
                            has Str $.type;
                            has Str $.description;
                        }
                        has X-next $.headersx-next is json-name('x-next');
                    }
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Headers $.headers;
                    has Schema $.schema;
                    has Str $.description;
                }
                has 200 $.responses200 is json-name('200');
                has Default $.default;
            }
            has Str $.operationId;
            has  @.tags;
            has Parameter @.parameters;
            has Str $.summary;
            has Responses $.responses;
        }
        class 201 does JSON::Class {
            has Str $.description;
        }
        class Post does JSON::Class {
            class 201 does JSON::Class {
                has Str $.description;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class Responses does JSON::Class {
                class 201 does JSON::Class {
                    has Str $.description;
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                has 201 $.responses201 is json-name('201');
                has Default $.default;
            }
            has Str $.operationId;
            has  @.tags;
            has Str $.summary;
            has Responses $.responses;
        }
        class /pets does JSON::Class {
            class Parameter does JSON::Class {
                has Str $.name;
                has Str $.description;
                has Str $.type;
                has Bool $.required;
                has Str $.in;
                has Str $.format;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class X-next does JSON::Class {
                has Str $.type;
                has Str $.description;
            }
            class Headers does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                has X-next $.headersx-next is json-name('x-next');
            }
            class 200 does JSON::Class {
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Headers $.headers;
                has Schema $.schema;
                has Str $.description;
            }
            class Responses does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class 200 does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    class Headers does JSON::Class {
                        class X-next does JSON::Class {
                            has Str $.type;
                            has Str $.description;
                        }
                        has X-next $.headersx-next is json-name('x-next');
                    }
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Headers $.headers;
                    has Schema $.schema;
                    has Str $.description;
                }
                has 200 $.responses200 is json-name('200');
                has Default $.default;
            }
            class Get does JSON::Class {
                class Parameter does JSON::Class {
                    has Str $.name;
                    has Str $.description;
                    has Str $.type;
                    has Bool $.required;
                    has Str $.in;
                    has Str $.format;
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class X-next does JSON::Class {
                    has Str $.type;
                    has Str $.description;
                }
                class Headers does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    has X-next $.headersx-next is json-name('x-next');
                }
                class 200 does JSON::Class {
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    class Headers does JSON::Class {
                        class X-next does JSON::Class {
                            has Str $.type;
                            has Str $.description;
                        }
                        has X-next $.headersx-next is json-name('x-next');
                    }
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Headers $.headers;
                    has Schema $.schema;
                    has Str $.description;
                }
                class Responses does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    class Default does JSON::Class {
                        class Schema does JSON::Class {
                            has Str $.schema$ref is json-name('$ref');
                        }
                        has Schema $.schema;
                        has Str $.description;
                    }
                    class X-next does JSON::Class {
                        has Str $.type;
                        has Str $.description;
                    }
                    class Headers does JSON::Class {
                        class X-next does JSON::Class {
                            has Str $.type;
                            has Str $.description;
                        }
                        has X-next $.headersx-next is json-name('x-next');
                    }
                    class 200 does JSON::Class {
                        class X-next does JSON::Class {
                            has Str $.type;
                            has Str $.description;
                        }
                        class Headers does JSON::Class {
                            class X-next does JSON::Class {
                                has Str $.type;
                                has Str $.description;
                            }
                            has X-next $.headersx-next is json-name('x-next');
                        }
                        class Schema does JSON::Class {
                            has Str $.schema$ref is json-name('$ref');
                        }
                        has Headers $.headers;
                        has Schema $.schema;
                        has Str $.description;
                    }
                    has 200 $.responses200 is json-name('200');
                    has Default $.default;
                }
                has Str $.operationId;
                has  @.tags;
                has Parameter @.parameters;
                has Str $.summary;
                has Responses $.responses;
            }
            class 201 does JSON::Class {
                has Str $.description;
            }
            class Post does JSON::Class {
                class 201 does JSON::Class {
                    has Str $.description;
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class Responses does JSON::Class {
                    class 201 does JSON::Class {
                        has Str $.description;
                    }
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    class Default does JSON::Class {
                        class Schema does JSON::Class {
                            has Str $.schema$ref is json-name('$ref');
                        }
                        has Schema $.schema;
                        has Str $.description;
                    }
                    has 201 $.responses201 is json-name('201');
                    has Default $.default;
                }
                has Str $.operationId;
                has  @.tags;
                has Str $.summary;
                has Responses $.responses;
            }
            has Get $.get;
            has Post $.post;
        }
        class /pets/{petId} does JSON::Class {
            class Parameter does JSON::Class {
                has Str $.name;
                has Str $.description;
                has Str $.type;
                has Bool $.required;
                has Str $.in;
            }
            class Schema does JSON::Class {
                has Str $.schema$ref is json-name('$ref');
            }
            class Default does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class 200 does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                has Schema $.schema;
                has Str $.description;
            }
            class Responses does JSON::Class {
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class 200 does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                has 200 $.responses200 is json-name('200');
                has Default $.default;
            }
            class Get does JSON::Class {
                class Parameter does JSON::Class {
                    has Str $.name;
                    has Str $.description;
                    has Str $.type;
                    has Bool $.required;
                    has Str $.in;
                }
                class Schema does JSON::Class {
                    has Str $.schema$ref is json-name('$ref');
                }
                class Default does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class 200 does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    has Schema $.schema;
                    has Str $.description;
                }
                class Responses does JSON::Class {
                    class Schema does JSON::Class {
                        has Str $.schema$ref is json-name('$ref');
                    }
                    class Default does JSON::Class {
                        class Schema does JSON::Class {
                            has Str $.schema$ref is json-name('$ref');
                        }
                        has Schema $.schema;
                        has Str $.description;
                    }
                    class 200 does JSON::Class {
                        class Schema does JSON::Class {
                            has Str $.schema$ref is json-name('$ref');
                        }
                        has Schema $.schema;
                        has Str $.description;
                    }
                    has 200 $.responses200 is json-name('200');
                    has Default $.default;
                }
                has Str $.operationId;
                has  @.tags;
                has Parameter @.parameters;
                has Str $.summary;
                has Responses $.responses;
            }
            has Get $.get;
        }
        has /pets $.paths/pets is json-name('/pets');
        has /pets/{petId} $.paths/pets/{petId} is json-name('/pets/{petId}');
    }
    class License does JSON::Class {
        has Str $.name;
    }
    class Code does JSON::Class {
        has Str $.type;
        has Str $.format;
    }
    class Message does JSON::Class {
        has Str $.type;
    }
    class Properties does JSON::Class {
        class Code does JSON::Class {
            has Str $.type;
            has Str $.format;
        }
        class Message does JSON::Class {
            has Str $.type;
        }
        has Code $.code;
        has Message $.message;
    }
    class Error does JSON::Class {
        class Code does JSON::Class {
            has Str $.type;
            has Str $.format;
        }
        class Message does JSON::Class {
            has Str $.type;
        }
        class Properties does JSON::Class {
            class Code does JSON::Class {
                has Str $.type;
                has Str $.format;
            }
            class Message does JSON::Class {
                has Str $.type;
            }
            has Code $.code;
            has Message $.message;
        }
        has Properties $.properties;
        has  @.required;
    }
    class Items does JSON::Class {
        has Str $.items$ref is json-name('$ref');
    }
    class Pets does JSON::Class {
        class Items does JSON::Class {
            has Str $.items$ref is json-name('$ref');
        }
        has Items $.items;
        has Str $.type;
    }
    class Name does JSON::Class {
        has Str $.type;
    }
    class Id does JSON::Class {
        has Str $.type;
        has Str $.format;
    }
    class Tag does JSON::Class {
        has Str $.type;
    }
    class Pet does JSON::Class {
        class Name does JSON::Class {
            has Str $.type;
        }
        class Id does JSON::Class {
            has Str $.type;
            has Str $.format;
        }
        class Tag does JSON::Class {
            has Str $.type;
        }
        class Properties does JSON::Class {
            class Name does JSON::Class {
                has Str $.type;
            }
            class Id does JSON::Class {
                has Str $.type;
                has Str $.format;
            }
            class Tag does JSON::Class {
                has Str $.type;
            }
            has Id $.id;
            has Name $.name;
            has Tag $.tag;
        }
        has Properties $.properties;
        has  @.required;
    }
    class Definitions does JSON::Class {
        class Code does JSON::Class {
            has Str $.type;
            has Str $.format;
        }
        class Message does JSON::Class {
            has Str $.type;
        }
        class Properties does JSON::Class {
            class Code does JSON::Class {
                has Str $.type;
                has Str $.format;
            }
            class Message does JSON::Class {
                has Str $.type;
            }
            has Code $.code;
            has Message $.message;
        }
        class Error does JSON::Class {
            class Code does JSON::Class {
                has Str $.type;
                has Str $.format;
            }
            class Message does JSON::Class {
                has Str $.type;
            }
            class Properties does JSON::Class {
                class Code does JSON::Class {
                    has Str $.type;
                    has Str $.format;
                }
                class Message does JSON::Class {
                    has Str $.type;
                }
                has Code $.code;
                has Message $.message;
            }
            has Properties $.properties;
            has  @.required;
        }
        class Items does JSON::Class {
            has Str $.items$ref is json-name('$ref');
        }
        class Pets does JSON::Class {
            class Items does JSON::Class {
                has Str $.items$ref is json-name('$ref');
            }
            has Items $.items;
            has Str $.type;
        }
        class Name does JSON::Class {
            has Str $.type;
        }
        class Id does JSON::Class {
            has Str $.type;
            has Str $.format;
        }
        class Tag does JSON::Class {
            has Str $.type;
        }
        class Pet does JSON::Class {
            class Name does JSON::Class {
                has Str $.type;
            }
            class Id does JSON::Class {
                has Str $.type;
                has Str $.format;
            }
            class Tag does JSON::Class {
                has Str $.type;
            }
            class Properties does JSON::Class {
                class Name does JSON::Class {
                    has Str $.type;
                }
                class Id does JSON::Class {
                    has Str $.type;
                    has Str $.format;
                }
                class Tag does JSON::Class {
                    has Str $.type;
                }
                has Id $.id;
                has Name $.name;
                has Tag $.tag;
            }
            has Properties $.properties;
            has  @.required;
        }
        has Error $.Error;
        has Pets $.Pets;
        has Pet $.Pet;
    }
}

# vim: ft=perl6
