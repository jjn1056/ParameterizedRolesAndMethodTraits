use MooseX::Declare;
class LoggedMethodsParameterizableRole {
    method my_method(Str $name, Int $age) {
        return "Hi $name, you are $age years old";
    }
    with HasLogging => {target_method=>'my_method'};
}

