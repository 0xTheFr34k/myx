{ 
  stdenv
, lib
, fetchurl
, nixosTests
, makeWrapper
, openjdk21
, which
, gawk
# Where neo4j should write its run-time,
# installaton-wide, mutable data (e.g. logs)
, runTimeNeo4jDir ? "/tmp/neo4j"
}:
stdenv.mkDerivation rec {
  pname = "neo4j";
  version = "2025.01.0";

  src = fetchurl {
    url = "https://neo4j.com/artifact.php?name=neo4j-community-${version}-unix.tar.gz";
    hash = "sha256-L99iR5/Pt55ePF2Zj8N4jGIYQuWW+n+wGRjUknIsz6U=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    echo "server.directories.data=${runTimeNeo4jDir}/data" >> conf/neo4j.conf
    echo "server.directories.logs=${runTimeNeo4jDir}/logs" >> conf/neo4j.conf
    echo "server.directories.run=${runTimeNeo4jDir}/run" >> conf/neo4j.conf
    echo  "dbms.security.auth_enabled=false" >> conf/neo4j.conf
    
    mkdir -p "$out/share/neo4j"
    cp -R * "$out/share/neo4j"

    mkdir -p "$out/bin"
    for NEO4J_SCRIPT in neo4j neo4j-admin cypher-shell
    do
        chmod +x "$out/share/neo4j/bin/$NEO4J_SCRIPT"
        makeWrapper "$out/share/neo4j/bin/$NEO4J_SCRIPT" \
            "$out/bin/$NEO4J_SCRIPT" \
            --prefix PATH : "${lib.makeBinPath [ openjdk21 which gawk ]}" \
            --set JAVA_HOME "${openjdk21}"
    done

    patchShebangs $out/share/neo4j/bin/neo4j-admin

    # user will be asked to change password on first login
    # password must be at least 8 characters long
    $out/bin/neo4j-admin dbms set-initial-password neo4jadmin
  '';

  passthru.tests.nixos = nixosTests.neo4j;

  meta = with lib; {
    description = "Highly scalable, robust (fully ACID) native graph database";
    homepage = "https://neo4j.com/";
    license = licenses.gpl3;
    maintainers = with maintainers; [ offline ];
    platforms = platforms.unix;
  };
}

