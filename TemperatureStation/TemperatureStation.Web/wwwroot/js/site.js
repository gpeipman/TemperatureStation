// Write your Javascript code.
Array.prototype.containsDate = function (obj) {
    var i = this.length;
    while (i--) {
        if (this[i].getTime() === obj.getTime()) {
            return true;
        }
    }
    return false;
}