use MooseX::Declare;
role MyParameterizableRole(
    Str :$target_method!,
    Str :$prefix! = "test"
) {
    requires $target_method;
    around "$target_method" (Str $string) {
        return $self->$orig("$prefix: $string");
    }
}
