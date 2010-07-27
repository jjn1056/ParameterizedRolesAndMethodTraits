use MooseX::Declare;
role MyMethodTrait {
    use Scalar::Util;
    has tag => (is=>'ro', isa=>'Str', required=>1, default=>'div');
    around wrap(ClassName $class: $code, %options) {
        my $method_obj;
        my $new_method = method(Str $string) {
            Scalar::Util::weaken($method_obj);
            my $tag = $method_obj->tag;
            my $title = $self->$code($string);
            return "<$tag>$title</$tag>";
        };
        $method_obj = $class->$orig($new_method->actual_body, %options);
        return $method_obj;
    }
}
