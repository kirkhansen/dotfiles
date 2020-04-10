function aws_key_fingerprint --argument private_key_path
    openssl pkey -in $private_key_path -pubout -outform DER | openssl md5 -c
end
