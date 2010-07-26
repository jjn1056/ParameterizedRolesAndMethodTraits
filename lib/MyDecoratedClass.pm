use MooseX::Declare;
class MyDecoratedClass {
    method title(Str $string) {
        return "'$string' is the title";
    }
    with 'MyParameterizableRole' => {
        target_method => "title",
        prefix => "FAQ",
    };
}

