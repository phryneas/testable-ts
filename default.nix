with import <nixpkgs> {};
buildEnv {
    name = "testable-ts.nix";
    paths = [
        ( callPackage ./testable-ts.nix {
            version = "3.7.4";
            sha256 = "1p9dqhfzmrv396y366nys8llf5i29kx2xr1akd3kjiy1lb8hckfr";
            patches = [ ./patches/3.7.4.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.6.4";
            sha256 = "0nsab0sl14rqqc8cfw5846bjh48105dznhp4nm6hq1r9krr5z4kl";
            patches = [ ./patches/3.6.4.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.5.3";
            sha256 = "1fzb105nazf7g0x9afqi7vipy0xlzz55iic0rfsf8ay666yqs5mm";
            patches = [ ./patches/3.5.3.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.4.5";
            sha256 = "0scdfxi4lx0qlkdqwp35vzjis46vc62yg4c62fq5mbhv23n5h8q7";
            patches = [ ./patches/3.4.5.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.3.4000";
            sha256 = "1lwdblp031k967c5rzad5vqwj3i1vqqnq25vh3026l9i10wbf8h9";
            patches = [ ./patches/3.3.4000.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.2.4";
            sha256 = "0yc6phmv9cm99dmwmpsjiq5c5sk379nmm0ha2jcb0lnlx2ifksr5";
            patches = [ ./patches/3.2.4.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.1.6";
            sha256 = "1xlx49907ac6n8xrv54dbalz4jbyz4qjmgk0b1ryhgpaz0wsbxil";
            patches = [ ./patches/3.1.6.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "3.0.3";
            sha256 = "0rh895n4irnfj7jn52wcl3a1lpfsn81n8yfg7wlqik286m34d332";
            patches = [ ./patches/3.0.3.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "2.9.2";
            sha256 = "0hn5z0nyc2pi7p9hjl8kvnk7wwk7dshn4m4iglxx5ni5xa3qqs8a";
            patches = [ ./patches/2.9.2.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "2.8.4";
            sha256 = "0wxzcj28pjaryz4piq32wjq0lmmmsx8qca98ymdzpvwmkfl51f3r";
            patches = [ ./patches/2.8.4.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "2.7.2";
            sha256 = "1ysgzy359s0vjg9zc6qjsgwgykkc38pby42bs6b0wp7zgjkpbidp";
            patches = [ ./patches/2.7.2.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "2.6.2";
            sha256 = "0fx4s2f5w5kaknf8q965a8a4az888ji28nbn2szq8vf764vpg8a0";
            patches = [ ./patches/2.6.2.patch ];
        })
        ( callPackage ./testable-ts.nix {
            version = "2.5.3";
            sha256 = "168qm6s51k4hyfsdzgl73bi10dkjks1gjz7qzg3khm20da99crj8";
            patches = [ ./patches/2.5.3.patch ];
        })
    ];
}