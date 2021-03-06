program test_loadtxt
use iso_fortran_env, only: sp=>real32, dp=>real64 ,qp=>real128
use stdlib_experimental_io, only: loadtxt, savetxt
use stdlib_experimental_error, only: assert
implicit none

call test_sp()
call test_dp()
call test_qp()

contains

    subroutine test_sp()
    real(sp) :: d(3, 2), e(2, 3)
    real(sp), allocatable :: d2(:, :)
    d = reshape([1, 2, 3, 4, 5, 6], [3, 2])
    call savetxt("tmp.dat", d)
    call loadtxt("tmp.dat", d2)
    call assert(all(shape(d2) == [3, 2]))
    call assert(all(abs(d-d2) < epsilon(1._sp)))

    e = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    call savetxt("tmp.dat", e)
    call loadtxt("tmp.dat", d2)
    call assert(all(shape(d2) == [2, 3]))
    call assert(all(abs(e-d2) < epsilon(1._sp)))
    end subroutine


    subroutine test_dp()
    real(dp) :: d(3, 2), e(2, 3)
    real(dp), allocatable :: d2(:, :)
    d = reshape([1, 2, 3, 4, 5, 6], [3, 2])
    call savetxt("tmp.dat", d)
    call loadtxt("tmp.dat", d2)
    call assert(all(shape(d2) == [3, 2]))
    call assert(all(abs(d-d2) < epsilon(1._dp)))

    e = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    call savetxt("tmp.dat", e)
    call loadtxt("tmp.dat", d2)
    call assert(all(shape(d2) == [2, 3]))
    call assert(all(abs(e-d2) < epsilon(1._dp)))
    end subroutine

    subroutine test_qp()
    real(qp) :: d(3, 2), e(2, 3)
    real(qp), allocatable :: d2(:, :)
    d = reshape([1, 2, 3, 4, 5, 6], [3, 2])
    call savetxt("tmp.dat", d)
    call loadtxt("tmp.dat", d2)
    call assert(all(shape(d2) == [3, 2]))
    call assert(all(abs(d-d2) < epsilon(1._qp)))

    e = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    call savetxt("tmp.dat", e)
    call loadtxt("tmp.dat", d2)
    call assert(all(shape(d2) == [2, 3]))
    call assert(all(abs(e-d2) < epsilon(1._qp)))
    end subroutine

end program
