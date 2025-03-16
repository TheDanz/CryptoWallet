import UIKit

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = CoinDetailsViewController(
            fullName: coins[indexPath.row].name,
            shortName: coins[indexPath.row].symbol,
            value: coins[indexPath.row].marketData.priceUSD,
            volatility: coins[indexPath.row].marketData.percentChangeUsdLastHour,
            capitalizationValue: coins[indexPath.row].marketCap.capitalizationUSD,
            supplyValue: coins[indexPath.row].supply.circulating
        )
        navigationController?.pushViewController(viewController, animated: true)
    }
}
