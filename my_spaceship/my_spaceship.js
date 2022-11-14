/*
**
** QWASAR.IO -- my_spaceship
**
**
** @param {String} param_1
** @return {Object}
**
*/



const checkRightDirection = (direction) => {
    if (direction === "up") direction = "right";
    else if (direction === "left") direction = "up"; 
    else if (direction === "right") direction = "down";
    else if (direction === "down") direction = "left"
    return direction;
}

const checkLeftDirection = (direction) => {
    if (direction === "up") direction = "left";
    else if (direction === "left") direction = "down";
    else if (direction === "down") direction = "right";
    else if (direction === "right") direction = "up";
    return direction;
}

const advanceShip = (direction, x_axis, y_axis) => {
    if (direction === "up") y_axis = --y_axis;
    else if (direction === "down") y_axis = ++y_axis;
    else if (direction === "right") x_axis = ++x_axis;
    else if (direction === "left") x_axis = --x_axis;
    return [x_axis, y_axis];
}

function my_spaceship(flight_path) {
    let ship_objs = {
        x: 0,
        y: 0,
        direction: "up",
    }

    for (let i = 0; i < flight_path.length; i++) {
        if (flight_path[i] === 'R') {
           ship_objs.direction = checkRightDirection(ship_objs.direction);
        } else if (flight_path[i] === 'L') {
            ship_objs.direction = checkLeftDirection(ship_objs.direction);
        } else if (flight_path[i] === 'A') {
           const coordinates = advanceShip(ship_objs.direction, ship_objs.x, ship_objs.y);
           ship_objs.x = coordinates[0]
           ship_objs.y = coordinates[1]
        }
    }
    return `{x: ${ship_objs.x}, y: ${ship_objs.y}, direction: '${ship_objs.direction}'}`
}

/*
const flight_path = "RRALAA";
const flight_path = "AAAA";
const flight_path = "RAARA";
const flight_path = "RAALALL";
console.log(my_spaceship(flight_path))
*/