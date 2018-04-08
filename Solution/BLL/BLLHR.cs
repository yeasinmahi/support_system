using DAL.DALHRTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BLL
{
    public class BLLHR
    {
        #region ================================ Support Log ======================================================
        public void InsertSupportLog(string strSupportName, string strStatus, int intActionBy)
        {
            try
            {
                SupportLogTableAdapter adp = new SupportLogTableAdapter();
                adp.InsertSupportLog(strSupportName, strStatus, intActionBy);
            }
            catch { }
        }
        #endregion ================================================================================================
        #region ============================== Employee Information Update ================================================
        public DataTable GetEmpInfoByEnroll(int enroll)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try { return adp.GetEmpInfoByEnroll(enroll); }
            catch { return new DataTable(); }
        }
        public DataTable GetEmpInfoByCode(string strCode)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try { return adp.GetEmpInfoByCode(strCode); }
            catch { return new DataTable(); }
        }
        public DataTable GetEmpInfoByEmail(string strEmail)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try { return adp.GetEmpInfoByEmail(strEmail); }
            catch { return new DataTable(); }
        }
        public void UpdateEmpInfo(string strCode, string strCardNo, string strName, string strEmail, int intSuperviserId, DateTime dteAppoint, DateTime dteJoinDate, string dteBirth, string strContact, bool ysnActive, bool ysnSalaryHold, int intEnroll)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try
            {
                adp.UpdateEmpInfo(strCode, strCardNo, strName, strEmail, intSuperviserId, dteAppoint, dteJoinDate, dteBirth, strContact, ysnActive, ysnSalaryHold, intEnroll);
            }
            catch { }
        }
        #endregion =========================================================================================================
        #region =============================== Employee Attendance ======================================================
        public DataTable GetAttendanceStatus(int intEnroll, int intMonth, int intYear)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try { return adp.GetAttendanceStatus(intEnroll, intMonth, intYear); }
            catch { return new DataTable(); }
        }
        public void UpdateAbsent(int intAutoID)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try
            {
                adp.UpdateAbsent(intAutoID);
            }
            catch { }
        }
        public void UpdatePresent(int intAutoID)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try
            {
                adp.UpdatePresent(intAutoID);
            }
            catch { }
        }
        public void UpdateMovement(int intAutoID)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try
            {
                adp.UpdateMovement(intAutoID);
            }
            catch { }
        }
        public void UpdateLeave(int intAutoID)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try
            {
                adp.UpdateLeave(intAutoID);
            }
            catch { }
        }
        public void UpdateHoliday(int intAutoID)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try
            {
                adp.UpdateHoliday(intAutoID);
            }
            catch { }
        }
        public void UpdateOffDay(int intAutoID)
        {
            TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
            try
            {
                adp.UpdateOffDay(intAutoID);
            }
            catch { }
        }
        public void DeleteFromDailySummary(int intAutoID)
        {
            try
            {
                LeaveTableAdapter adp = new LeaveTableAdapter();
                adp.DeleteFromDailySummary(intAutoID);
            }
            catch { }
        }
        public void UpdateAttendance(int intEnroll, string dteDate)
        {
            try
            {
                TblAttendanceDailySummaryTableAdapter adp = new TblAttendanceDailySummaryTableAdapter();
                adp.UpdateAttendance(intEnroll, dteDate);
            }
            catch { }
        }
        #endregion ========================================================================================================
        #region ================================ Privilege Leave ==========================================================

        public DataTable GetAmountInfo(int intYear, int intEnroll)
        {
            PLAmountInfoTableAdapter adp = new PLAmountInfoTableAdapter();
            try { return adp.GetPLAmountInfo(intYear, intEnroll); }
            catch { return new DataTable(); }
        }
        public DataTable GetBasic( int intYear, int intEnroll)
        {
            TblMonthlySalaryGenerateTableAdapter adp = new TblMonthlySalaryGenerateTableAdapter();
            try { return adp.GetBasic(intYear, intEnroll); }
            catch { return new DataTable(); }
        }
        public DataTable GetEmpBasic(int intEnroll)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try { return adp.GetEmpBasic(intEnroll); }
            catch { return new DataTable(); }
        }
        public DataTable GetPLInfo(int intEnroll, int intYear)
        {
            TblEmpPLELTableAdapter adp = new TblEmpPLELTableAdapter();
            try { return adp.GetPLInfo(intEnroll, intYear); }
            catch { return new DataTable(); }
        }
        public DataTable GetPLDate(int intEnroll, int intYear)
        {
            TblLeaveApplicationTableAdapter adp = new TblLeaveApplicationTableAdapter();
            try { return adp.GetPLDate(intEnroll, intYear); }
            catch { return new DataTable(); }
        }
        public void InsertPLSchedule(int intEnroll, decimal monBasic, int intYear, bool ysnTaken)
        {
            try
            {
                TblEmpPLELTableAdapter adp = new TblEmpPLELTableAdapter();
                adp.InsertPLSchedule(intEnroll, monBasic, intYear, ysnTaken);
            }
            catch { }
        }
        public void UpdatePLTaken(int intEnroll, int intYear)
        {
            try
            {
                TblEmpPLELTableAdapter adp = new TblEmpPLELTableAdapter();
                adp.UpdatePLTaken(intEnroll, intYear);
            }
            catch { }

        }
        public void UpdatePLAmount(decimal monAmount, int intAllowanceId)
        {
            try
            {
                TblAllowanceTableAdapter adp = new TblAllowanceTableAdapter();
                adp.UpdatePLAmount(monAmount, intAllowanceId);
            }
            catch { }

        }
        public void InsertAllowance(int intMonthID, int intYearID, int intEnroll, int intLoginID)
        {
            try
            {
                TblAllowanceTableAdapter adp = new TblAllowanceTableAdapter();
                adp.InsertAllowance(intMonthID, intYearID, intEnroll, intLoginID);
            }
            catch { }
        }
        public void InsertAllowanceDetails(int intAllowanceID, decimal monAmount)
        {
            try
            {
                TblAllowanceTableAdapter adp = new TblAllowanceTableAdapter();
                adp.InsertAllowanceDetails(intAllowanceID, monAmount);
            }
            catch { }
        }
        public DataTable GetAllowanceID(int intYear, int intEnroll)
        {
            PLAmountInfoTableAdapter adp = new PLAmountInfoTableAdapter();
            try { return adp.GetAllowanceID(intYear, intEnroll); }
            catch { return new DataTable(); }
        }
        public DataTable GetPLBalance(int intEnroll)
        {
            LeaveTableAdapter adp = new LeaveTableAdapter();
            try { return adp.GetPLBalance(intEnroll); }
            catch { return new DataTable(); }
        }
        
        public void UpdateNewLeave(int intEnroll, int intApplicationID)
        {
            try
            {
                LeaveTableAdapter adp = new LeaveTableAdapter();
                adp.UpdateNewLeave(intEnroll, intApplicationID);
            }
            catch { }
        }
        public void UpdatePLBalance(int intLeaveTakenDays, int intRemainingDays, int intEnroll, int intAutoId)
        {
            try
            {
                LeaveTableAdapter adp = new LeaveTableAdapter();
                adp.UpdatePLBalance(intLeaveTakenDays, intRemainingDays, intEnroll, intAutoId);
            }
            catch { }
        }
        public void UpdatePresentStatus(int intEnroll, string dteFrom, string dteTo)
        {
            try
            {
                LeaveTableAdapter adp = new LeaveTableAdapter();
                adp.UpdatePresentStatus(intEnroll, dteFrom, dteTo);
            }
            catch { }
        }
        public void UpdatePresentStatus(int intDayId, int intMonthId, int intYear, int intEnroll)
        {
            try
            {
                LeaveTableAdapter adp = new LeaveTableAdapter();
                adp.InsertDailyAttendance(intDayId, intMonthId, intYear, intEnroll);
            }
            catch { }
        }
        public void UpdateLeaveDays(DateTime dteOldFrom, DateTime dteOldTo, DateTime dteNewFrom, DateTime dteNewTo, int intEnroll, int intApplicationID, int intActionBy, int intLeaveTypeID, int intOldDiff, int intNewDiff)
        {
            SprLeaveUpdateTableAdapter adp = new SprLeaveUpdateTableAdapter();
            try
            {
                adp.UpdateLeaveDays(dteOldFrom, dteOldTo, dteNewFrom, dteNewTo, intEnroll, intApplicationID, intActionBy, intLeaveTypeID, intOldDiff, intNewDiff);
            }
            catch { }
        }

        #endregion ========================================================================================================
        #region================================ Responsible Person Setup ====================================================
        public DataTable GetResponsibleData(int intEnroll)
        {
            TblRemoteEmployeeForAttendanceTableAdapter adp = new TblRemoteEmployeeForAttendanceTableAdapter();
            try
            { return adp.GetResponsibleData(intEnroll); }
            catch { return new DataTable(); }
        }
        public void UpdateResponsible(int intResponsibleEnroll, int intActionBy, int intEnroll)
        {
            try
            {
                TblRemoteEmployeeForAttendanceTableAdapter adp = new TblRemoteEmployeeForAttendanceTableAdapter();
                adp.UpdateResponsible(intResponsibleEnroll, intActionBy, intEnroll);
            }
            catch { }
        }
        public void UpdateSupervisorTab(int intActionBy, int intResponsibleEnroll)
        {
            try
            {
                TblRemoteEmployeeForAttendanceTableAdapter adp = new TblRemoteEmployeeForAttendanceTableAdapter();
                adp.UpdateSupervisorTab(intActionBy, intResponsibleEnroll);
            }
            catch { }
        }
        public void InsertResposible(int intEnroll, int intResponsibleEnroll, int intActionBy)
        {
            try
            {
                TblRemoteEmployeeForAttendanceTableAdapter adp = new TblRemoteEmployeeForAttendanceTableAdapter();
                adp.InsertResponsible(intEnroll, intResponsibleEnroll, intActionBy);
            }
            catch { }
        }
        #endregion===========================================================================================================
        #region ============================ Attendance Report =================================================================
        public DataTable GetAttendance(int intEnroll, DateTime dteDate)
        {
            SprGetAttendanceTableAdapter adp = new SprGetAttendanceTableAdapter();
            try { return adp.GetAttendance(intEnroll, dteDate); }
            catch { return new DataTable(); }
        }
        #endregion==============================================================================================================
        #region ============================ HR.AKIJ.NET Permission =================================================================
        public DataTable GetEmpInfoForPermission(int intEnroll, string strEmail)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try { return adp.GetEmpInfoForHRPermission(intEnroll, strEmail); }
            catch { return new DataTable(); }
        }
        public void InsertPermissionData(int intEnroll)
        {
            try
            {
                UserInfoTableAdapter adp = new UserInfoTableAdapter();
                adp.InsertPermissionData(intEnroll);
            }
            catch { }
        }
        public void DeletePermissionDataByEnroll(int intEnroll)
        {
            try
            {
                UserInfoTableAdapter adp = new UserInfoTableAdapter();
                adp.DeleteDataByEnroll(intEnroll);
            }
            catch { }
        }
        public void DeletePermissionDataByEmail(string strEmail)
        {
            try
            {
                UserInfoTableAdapter adp = new UserInfoTableAdapter();
                adp.DeleteDataByEmail(strEmail);
            }
            catch { }
        }
        public DataTable GetDuplicateEmail(string strEmail)
        {
            TblEmployeeTableAdapter adp = new TblEmployeeTableAdapter();
            try { return adp.GetDuplicateEmail(strEmail); }
            catch { return new DataTable(); }
        }
        #endregion==============================================================================================================
        #region ================================ Leave Balance ==============================================================
        public DataTable GetLeaveBalance(int enroll)
        {
            TblLeaveBalanceTableAdapter adp = new TblLeaveBalanceTableAdapter();
            try { return adp.GetLeaveBalance(enroll); }
            catch { return new DataTable(); }
        }
        public void UpdateLeaveBalance(int intLeaveTakenDays, int intRemainingDays, int intAutoId)
        {
            TblLeaveBalanceTableAdapter adp = new TblLeaveBalanceTableAdapter();
            try
            {
                adp.UpdateLeaveBalance(intLeaveTakenDays, intRemainingDays, intAutoId);
            }
            catch { }
        }
        #endregion ==========================================================================================================
        #region ============================================== Loan Status ==================================================
        public DataTable GetLoanStatus(int enroll)
        {
            LoanTableAdapter adp = new LoanTableAdapter();
            try { return adp.GetLoanStatus(enroll); }
            catch { return new DataTable(); }
        }
        public void CompleteLoan(int intAppID)
        {
            LoanTableAdapter adp = new LoanTableAdapter();
            try
            {
                adp.UpdateAllLoanComplete(intAppID);
            }
            catch { }
        }
        public DataTable GetLoanDetails(int intAppID)
        {
            LoanTableAdapter adp = new LoanTableAdapter();
            try { return adp.GetLoanDetails(intAppID); }
            catch { return new DataTable(); }
        }
        public void UpdateSingleLoan(int intID)
        {
            LoanTableAdapter adp = new LoanTableAdapter();
            try
            {
                adp.UpdateSingleLoan(intID);
            }
            catch { }
        }
        public void UpdateLoanStatus(int intID)
        {
            LoanTableAdapter adp = new LoanTableAdapter();
            try
            {
                adp.UpdateLoanStatus(intID);
            }
            catch { }
        }
        public DataTable GetInstallment(int intAppID)
        {
            LoanTableAdapter adp = new LoanTableAdapter();
            try { return adp.GetInstallment(intAppID); }
            catch { return new DataTable(); }
        }
        #endregion =========================================================================================================
        #region ================================= Leave Application ==================================================
        public DataTable GetLeaveSummary(string strCode, int intEnroll)
        {
            SprLeave_ApplicationSummaryByEmployeeTableAdapter adp = new SprLeave_ApplicationSummaryByEmployeeTableAdapter();
            try
            {
                return adp.GetLeaveSummary(strCode, intEnroll);
            }
            catch { return new DataTable(); }
        }

        #endregion======================================================================================================
        #region ================================= ERP Permission ==================================================
        public DataTable InsertPermission(int? intEnroll, string strCode, string strEmail, string strPAccName, int? intGroup)
        {
            SprERPUserCreateUpdateTableAdapter adp = new SprERPUserCreateUpdateTableAdapter();
            try
            {
                return adp.InsertLoginPermission(intEnroll, strCode, strEmail, strPAccName, intGroup);
            }
            catch { return new DataTable(); }
        }
        public void InsertMenuPermission(int? intEnroll, string strCode, int intRoleID, bool ysnActive, int intActionBy)
        {
            SprRolePermissionByEnrollNRoleTableAdapter adp = new SprRolePermissionByEnrollNRoleTableAdapter();
            try
            {
                adp.InsertMenuPermission(intEnroll, strCode, intRoleID, ysnActive, intActionBy);
            }
            catch { }
        }
        public void DeleteUnit(int intEnroll, int intUnitID)
        {
            DeleteUnitTableAdapter adp = new DeleteUnitTableAdapter();
            try
            {
                adp.DeleteUnitByUser(intEnroll, intUnitID);
            }
            catch { }
        }
        public void DeleteJobStation(int intEnroll, int intJobStation)
        {
            DeleteJobStationTableAdapter adp = new DeleteJobStationTableAdapter();
            try
            {
                adp.DeleteJobStation(intEnroll, intJobStation);
            }
            catch { }
        }
        public void InsertUnitJobStation(int intPart, int intEnroll, int? intUnitID, int? intJobStation)
        {
            SprInsertUnitJobStationPermissionTableAdapter adp = new SprInsertUnitJobStationPermissionTableAdapter();
            try
            {
                adp.InsertUnitJobStationPermission(intPart, intEnroll, intUnitID, intJobStation);
            }
            catch { }
        }
        public DataTable GetPermissionList(int intEnroll)
        {
            SprRolePermissionByEnrollTableAdapter adp = new SprRolePermissionByEnrollTableAdapter();
            try
            {
                return adp.GetPermissionList(intEnroll);
            }
            catch { return new DataTable(); }
        }
        public DataTable GetUserUnitList(int intEnroll)
        {
            TblUnitByUserTableAdapter adp = new TblUnitByUserTableAdapter();
            try
            {
                return adp.GetUnitList(intEnroll);
            }
            catch { return new DataTable(); }
        }
        public DataTable GetAllUnitList()
        {
            TblUnitTableAdapter adp = new TblUnitTableAdapter();
            try
            {
                return adp.GetAllUnitList();
            }
            catch { return new DataTable(); }
        }
        public DataTable GetJobStationByUnit(int intUnitID)
        {
            TblEmployeeJobStationTableAdapter adp = new TblEmployeeJobStationTableAdapter();
            try
            {
                return adp.GetJobStationByUnit(intUnitID);
            }
            catch { return new DataTable(); }
        }
        public DataTable GetJobStationByEnroll(int intEnroll)
        {
            JobStationTableAdapter adp = new JobStationTableAdapter();
            try
            {
                return adp.GetJobStationByEnroll(intEnroll);
            }
            catch { return new DataTable(); }
        }
        #endregion======================================================================================================

    }
}