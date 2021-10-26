<?php
$connect = mysqli_connect("localhost", "root", "123456", "classicmodels");
if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
}

mysqli_autocommit($connect, false);

mysqli_query($connect, 'start transaction');

if (!mysqli_query($connect, 'insert into t1(id) values(13)')) {
    echo "insert failed: " . mysqli_error($connect);
    exit();
}

// mysqli_commit($connect);
if (!mysqli_commit($connect)) {
    echo "Commit transaction failed: " . mysqli_error($connect);
    exit();
}

if ($result = mysqli_query($connect, "SELECT COUNT(*) FROM t1")) {
    $row = mysqli_fetch_row($result);
    printf("%d rows in table t1.\n", $row[0]);
    /* Free result */
    mysqli_free_result($result);
}

mysqli_rollback($connect);

if ($result = mysqli_query($connect, "SELECT COUNT(*) FROM t1")) {
    $row = mysqli_fetch_row($result);
    printf("%d rows in table t1 (after rollback).\n", $row[0]);
    /* Free result */
    mysqli_free_result($result);
}

mysqli_close($connect);