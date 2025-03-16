import UIKit

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coins.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinTableViewCell.identifier) as? CoinTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(
            image: coins[indexPath.row].symbol == "BTC" ? .bitcoinIcon : .cryptoCoinIcon,
            fullName: coins[indexPath.row].name,
            shortName: coins[indexPath.row].symbol,
            value: coins[indexPath.row].marketData.priceUSD,
            volatility: coins[indexPath.row].marketData.percentChangeUsdLastHour
        )
        return cell
    }
}
