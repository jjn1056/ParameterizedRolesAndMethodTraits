use MooseX::Declare;
role HasLoggingMethodTrait {
    use Scalar::Util 'weaken';
    require Data::Dumper;
    around wrap(ClassName $class: $code, %options) {
        my ($method_obj, $weak_method_obj);
        $method_obj = $weak_method_obj = $class->$orig(sub {
            my ($self, @args) = @_;
            my $target_method = $weak_method_obj->name;
            warn "$target_method was called with " . Data::Dumper::Dumper(\@args);
            return $self->$code(@args);
        }, %options);
        weaken($weak_method_obj);
        return $method_obj;
    }
}

