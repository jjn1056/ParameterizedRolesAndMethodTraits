use MooseX::Declare;
class LoggedMethodsMethodTrait {
    method my_method(Str $name, Int $age)
    does HasLoggingMethodTrait {
        return "Hi $name, you are $age years old";
    }
}

