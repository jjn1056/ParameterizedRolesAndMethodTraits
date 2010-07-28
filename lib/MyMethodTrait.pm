use MooseX::Declare;
role MyMethodTrait {
    use Scalar::Util 'weaken';
    has tag => (is=>'ro', isa=>'Str', required=>1, default=>'div');
    around wrap(ClassName $class: $code, %options) {
        my ($method_obj, $weak_method_obj);
        $method_obj = $weak_method_obj = $class->$orig(sub {
            my ($self, $string) = @_;
            my $title = $self->$code($string);
            my $tag = $weak_method_obj->tag;
            return "<$tag>$title</$tag>";
        }, %options);
        weaken($weak_method_obj);
        return $method_obj;
    }
}

