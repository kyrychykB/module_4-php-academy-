<?php

/**
 * Prints info about element. If you want to get full info set '$trigger = true'
 * @param $element
 * @param bool $trigger
 */
function debug($element, $trigger = false) {
    echo '<pre>';
    if($trigger)
        var_dump($element);
    else
        print_r($element);
    echo '</pre>';
}