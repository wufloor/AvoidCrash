Pod::Spec.new do |s|
s.name         = "AvoidCrashNext"
s.version      = "2.5.3"
s.ios.deployment_target = '14.0'
s.summary      = "This framework can avoid Foundation framework potential crash danger"
s.homepage     = "https://github.com/wufloor/AvoidCrashNext"
s.license      = "MIT"
s.author             = { "陈蕃坊" => "493336001@qq.com","wufloor" => "" }
s.social_media_url   = "http://www.jianshu.com/users/80fadb71940d/latest_articles"
s.source       = { :git => "https://github.com/wufloor/AvoidCrashNext.git", :tag => s.version }

s.source_files  = 'AvoidCrash/**/*.{h,m}'
s.requires_arc = [
                  'AvoidCrash/AvoidCrash.m',
                  'AvoidCrash/AvoidCrashStubProxy.m',
                  'AvoidCrash/NSObject+AvoidCrash.m',
                  'AvoidCrash/NSArray+AvoidCrash.m',
                  'AvoidCrash/NSDictionary+AvoidCrash.m',
                  'AvoidCrash/NSMutableDictionary+AvoidCrash.m',
                  'AvoidCrash/NSString+AvoidCrash.m',
                  'AvoidCrash/NSMutableString+AvoidCrash.m',
                  'AvoidCrash/NSAttributedString+AvoidCrash.m',
                  'AvoidCrash/NSMutableAttributedString+AvoidCrash.m']


end


