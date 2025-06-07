__color_hex() {
    echo $(__color_rgb $(__hex_to_rgb $1))
}
