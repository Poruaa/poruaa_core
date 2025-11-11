import 'package:drift/drift.dart';
import 'package:poruaa_core/data/dao/db/database.dart';
import 'package:poruaa_core/data/services/wallet/model/payment_method_model.dart';

part 'withdrawal_payment_method_dao.g.dart';

/// DAO for withdrawal payment methods
@DriftAccessor(tables: [WithdrawalPaymentMethodItems])
class WithdrawalPaymentMethodDao extends DatabaseAccessor<AppDatabase>
    with _$WithdrawalPaymentMethodDaoMixin {
  WithdrawalPaymentMethodDao(super.db);

  /// Get all payment methods for a wallet
  Future<List<WithdrawalPaymentMethodItem>> getPaymentMethods(int walletId) {
    return (select(withdrawalPaymentMethodItems)
          ..where((tbl) => tbl.walletId.equals(walletId))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  /// Get a specific payment method by ID
  Future<WithdrawalPaymentMethodItem?> getPaymentMethod(int id) {
    return (select(
      withdrawalPaymentMethodItems,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Get primary payment method for a wallet
  Future<WithdrawalPaymentMethodItem?> getPrimaryPaymentMethod(int walletId) {
    return (select(withdrawalPaymentMethodItems)..where(
          (tbl) => tbl.walletId.equals(walletId) & tbl.isPrimary.equals(true),
        ))
        .getSingleOrNull();
  }

  /// Get active payment methods for a wallet
  Future<List<WithdrawalPaymentMethodItem>> getActivePaymentMethods(
    int walletId,
  ) {
    return (select(withdrawalPaymentMethodItems)
          ..where(
            (tbl) => tbl.walletId.equals(walletId) & tbl.isActive.equals(true),
          )
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.createdAt)]))
        .get();
  }

  /// Insert a new payment method
  Future<int> insertPaymentMethod(
    WithdrawalPaymentMethodItemsCompanion paymentMethod,
  ) {
    return into(
      withdrawalPaymentMethodItems,
    ).insertOnConflictUpdate(paymentMethod);
  }

  /// Update a payment method
  Future<bool> updatePaymentMethod(
    int id,
    WithdrawalPaymentMethodItemsCompanion paymentMethod,
  ) {
    return (update(withdrawalPaymentMethodItems)
          ..where((tbl) => tbl.id.equals(id)))
        .write(paymentMethod)
        .then((rowsAffected) => rowsAffected > 0);
  }

  /// Delete a payment method
  Future<bool> deletePaymentMethod(int id) {
    return (delete(withdrawalPaymentMethodItems)
          ..where((tbl) => tbl.id.equals(id)))
        .go()
        .then((rowsAffected) => rowsAffected > 0);
  }

  /// Set primary payment method (unset others first)
  Future<void> setPrimaryPaymentMethod(
    int walletId,
    int paymentMethodId,
  ) async {
    // First, unset all primary flags for this wallet
    await (update(
      withdrawalPaymentMethodItems,
    )..where((tbl) => tbl.walletId.equals(walletId))).write(
      const WithdrawalPaymentMethodItemsCompanion(isPrimary: Value(false)),
    );

    // Then set the new primary
    await (update(
      withdrawalPaymentMethodItems,
    )..where((tbl) => tbl.id.equals(paymentMethodId))).write(
      const WithdrawalPaymentMethodItemsCompanion(isPrimary: Value(true)),
    );
  }

  /// Convert model to database item
  WithdrawalPaymentMethodItemsCompanion modelToCompanion(
    PaymentMethodModel model,
  ) {
    return WithdrawalPaymentMethodItemsCompanion(
      id: Value(model.id),
      walletId: Value(model.walletId),
      methodType: Value(model.methodType),
      methodName: Value(model.methodName),
      bankName: Value(model.bankName),
      accountNumber: Value(model.accountNumber),
      accountHolderName: Value(model.accountHolderName),
      routingNumber: Value(model.routingNumber),
      branchName: Value(model.branchName),
      mobileBankingProvider: Value(model.mobileBankingProvider),
      mobileNumber: Value(model.mobileNumber),
      accountType: Value(model.accountType),
      cashOutLocation: Value(model.cashOutLocation),
      cashOutContact: Value(model.cashOutContact),
      isVerified: Value(model.isVerified),
      isPrimary: Value(model.isPrimary),
      isActive: Value(model.isActive),
      createdAt: Value(model.createdAt),
      updatedAt: Value(model.updatedAt),
    );
  }

  /// Convert database item to model
  PaymentMethodModel itemToModel(WithdrawalPaymentMethodItem item) {
    return PaymentMethodModel(
      id: item.id,
      walletId: item.walletId,
      methodType: item.methodType,
      methodName: item.methodName,
      bankName: item.bankName,
      accountNumber: item.accountNumber,
      accountHolderName: item.accountHolderName,
      routingNumber: item.routingNumber,
      branchName: item.branchName,
      mobileBankingProvider: item.mobileBankingProvider,
      mobileNumber: item.mobileNumber,
      accountType: item.accountType,
      cashOutLocation: item.cashOutLocation,
      cashOutContact: item.cashOutContact,
      isVerified: item.isVerified,
      isPrimary: item.isPrimary,
      isActive: item.isActive,
      createdAt: item.createdAt ?? DateTime.now(),
      updatedAt: item.updatedAt ?? DateTime.now(),
    );
  }

  /// Clear all payment methods for a wallet (useful for logout)
  Future<void> clearPaymentMethods(int walletId) {
    return (delete(
      withdrawalPaymentMethodItems,
    )..where((tbl) => tbl.walletId.equals(walletId))).go();
  }
}
