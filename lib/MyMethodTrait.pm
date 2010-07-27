use MooseX::Declare;
role MyMethodTrait {
    use Scalar::Util;
    has tag => (is=>'ro', isa=>'Str', required=>1, default=>'div');
    around wrap(ClassName $class: $code, %options) {
        my $method_obj;
        Scalar::Util::weaken(my $weakened_method_obj = $method_obj);
        my $replacement = sub {
            my ($self, $string) = @_;

warn ref $self; ## Good
warn $string; ## Good
warn ref $method_obj;  ## Is the correct objecy
warn ref $weakened_method_obj;  ## is undef no matter what I do

            my $tag = $weakened_method_obj->tag;
            my $title = $self->$code($string);
            return "<$tag>$title</$tag>";
        };
        $method_obj = $class->$orig($replacement, %options);
        return $method_obj;
    }
}
