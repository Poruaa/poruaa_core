import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/wallet/model/withdrawal_request_model.dart';

part 'withdrawal_request_dao.g.dart';

/// DAO for withdrawal requests
@DriftAccessor(tables: [WithdrawalRequestItems])
class WithdrawalRequestDao extends DatabaseAccessor<AppDatabase>
    with _$WithdrawalRequestDaoMixin {
  WithdrawalRequestDao(super.db);

  /// Get all withdrawal requests for a wallet
  Future<List<WithdrawalRequestItem>> getWithdrawalRequests(int walletId) {
    return (select(withdrawalRequestItems)
          ..where((tbl) => tbl.walletId.equals(walletId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  /// Get a specific withdrawal request by ID
  Future<WithdrawalRequestItem?> getWithdrawalRequest(int id) {
    return (select(
      withdrawalRequestItems,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get pending withdrawal requests for a wallet
  Future<List<WithdrawalRequestItem>> getPendingWithdrawalRequests(
    int walletId,
  ) {
    return (select(withdrawalRequestItems)
          ..where(
            (tbl) =>
                tbl.walletId.equals(walletId) & tbl.status.equals('pending'),
          )
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  /// Get withdrawal requests by status
  Future<List<WithdrawalRequestItem>> getWithdrawalRequestsByStatus(
    int walletId,
    String status,
  ) {
    return (select(withdrawalRequestItems)
          ..where(
            (tbl) => tbl.walletId.equals(walletId) & tbl.status.equals(status),
          )
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  /// Insert a new withdrawal request
  Future<int> insertWithdrawalRequest(WithdrawalRequestItemsCompanion request) {
    return into(withdrawalRequestItems).insert(request);
  }

  /// Update a withdrawal request
  Future<bool> updateWithdrawalRequest(
    int id,
    WithdrawalRequestItemsCompanion request,
  ) {
    return (update(withdrawalRequestItems)..where((tbl) => tbl.id.equals(id)))
        .write(request)
        .then((rowsAffected) => rowsAffected > 0);
  }

  /// Delete a withdrawal request
  Future<bool> deleteWithdrawalRequest(int id) {
    return (delete(withdrawalRequestItems)..where((tbl) => tbl.id.equals(id)))
        .go()
        .then((rowsAffected) => rowsAffected > 0);
  }

  /// Check if user has pending withdrawal request
  Future<bool> hasPendingWithdrawalRequest(int walletId) {
    return (select(withdrawalRequestItems)..where(
          (tbl) => tbl.walletId.equals(walletId) & tbl.status.equals('pending'),
        ))
        .get()
        .then((requests) => requests.isNotEmpty);
  }

  /// Get latest withdrawal request for a wallet
  Future<WithdrawalRequestItem?> getLatestWithdrawalRequest(int walletId) {
    return (select(withdrawalRequestItems)
          ..where((tbl) => tbl.walletId.equals(walletId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)])
          ..limit(1))
        .getSingleOrNull();
  }

  /// Convert model to database item
  WithdrawalRequestItemsCompanion modelToCompanion(
    WithdrawalRequestModel model,
  ) {
    return WithdrawalRequestItemsCompanion(
      id: Value(model.id),
      walletId: Value(model.walletId),
      paymentMethodId: Value(model.paymentMethodId),
      amount: Value(model.amount),
      status: Value(model.status),
      adminNotes: Value(model.adminNotes),
      processedBy: Value(model.processedBy),
      processedAt: Value(model.processedAt),
      createdAt: Value(model.createdAt),
      updatedAt: Value(model.updatedAt),
    );
  }

  /// Convert database item to model
  WithdrawalRequestModel itemToModel(WithdrawalRequestItem item) {
    return WithdrawalRequestModel(
      id: item.id,
      walletId: item.walletId,
      paymentMethodId: item.paymentMethodId,
      amount: item.amount,
      status: item.status,
      adminNotes: item.adminNotes,
      processedBy: item.processedBy,
      processedAt: item.processedAt,
      createdAt: item.createdAt ?? DateTime.now(),
      updatedAt: item.updatedAt ?? DateTime.now(),
    );
  }

  /// Clear all withdrawal requests for a wallet (useful for logout)
  Future<void> clearWithdrawalRequests(int walletId) {
    return (delete(
      withdrawalRequestItems,
    )..where((tbl) => tbl.walletId.equals(walletId))).go();
  }
}
