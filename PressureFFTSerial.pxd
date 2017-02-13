cimport ParallelMPI
cimport Grid
cimport ReferenceState
cimport SparseSolvers
cimport DiagnosticVariables

cdef class PressureFFTSerial:

    cdef:
        float [:] a
        float [:] b
        float [:] c
        float [:] kx2
        float [:] ky2
        inline void compute_diagonal(self, Grid.Grid Gr, ReferenceState.ReferenceState RS, Py_ssize_t i, Py_ssize_t j) nogil
    cdef SparseSolvers.TDMA TDMA_Solver
    cpdef initialize(self, Grid.Grid Gr, ReferenceState.ReferenceState RS, ParallelMPI.ParallelMPI Pa)
    cpdef compute_modified_wave_numbers(self,Grid.Grid Gr)
    cpdef compute_off_diagonals(self,Grid.Grid Gr, ReferenceState.ReferenceState RS)
    cpdef solve(self,Grid.Grid Gr, ReferenceState.ReferenceState RS,DiagnosticVariables.DiagnosticVariables DV, ParallelMPI.ParallelMPI PM)
